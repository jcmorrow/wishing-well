class SimulateGameTurn < ActiveJob::Base
  def perform(game:)
    game.players.each(&:take_turn!)
  end
end
