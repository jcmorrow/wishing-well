class SimulateGame < ActiveJob::Base
  def perform(match:)
    @game = Game.create(match: match)
    @players ||= @game.match.strategies.map do |strategy|
      game_strategy = GameStrategy.create(game: game, strategy: strategy)
      Player.new(game_strategy)
    end
    run
  end

  private

  attr_accessor :game, :players

  def run
    turn_count = 0
    until finished?
      turn_count += 1
      players.each(&:take_turn)
      record_player_turns(turn_count)
    end
    finish_game
  end

  def record_player_turns(turn_number)
    players.each do |player|
      player.game_strategy.turns.build(
        points_gained: player.total_points,
        money_gained: player.total_money,
        number: turn_number,
      )
    end
  end

  def finished?
    players.any? { |player| player.total_points >= 30 }
  end

  def finish_game
    game.update(winner: winning_strategy, finished_at: Time.current)
    players.each { |p| p.game_strategy.save }
  end

  def winning_strategy
    game.winner = players.max_by(&:total_points).game_strategy
  end
end
