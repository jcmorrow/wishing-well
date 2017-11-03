class Match < ActiveRecord::Base
  has_many :games
  has_and_belongs_to_many :strategies
  validates :strategies, presence: true
  validates :game_count, presence: true

  def win_rates
    fills = fake_fills
    composed_win_rates = []
    strategies.each.with_index do |strategy, index|
      composed_win_rates.push(
        name: strategy.name,
        win_rate: win_rate_by_strategy(strategy), 
        fill: fills[index],
      )
    end
    composed_win_rates
  end

  def deck_lists
    composed_deck_lists = []
    strategies.each do |strategy|
      composed_deck_lists << {
        name: strategy.name,
        deck_list: deck_lists_by_strategy(strategy),
      }
    end
    composed_deck_lists
  end

  def turn_summary
    fills = fake_fills
    strategies.map.with_index do |strategy, index|
      {
        name: strategy.name,
        turn_summary: turn_summary_by_strategy(strategy),
        color: fills[index],
      }
    end
  end

  def win_rate_by_strategy strategy
    return 0 if games.count == 0
    games_won = games.
      joins(:winner).
      where(game_strategies: { strategy: strategy }).count
    (games_won / games.count.to_f * 100).round(2)
  end

  def turn_summary_by_strategy(strategy)
    game_strategies.
      joins(:turns, :strategy).
      where(strategy: strategy).
      group(:number).
      average(:points_gained).map do |key, value|
        [key, value.round(2).to_f]
      end.sort
  end

  def deck_lists_by_strategy(strategy)
    # I don't know how to report on multiple card lists, but I can report on the
    # last one?
    game_strategies.where(strategy: strategy).last.cards.map(&:to_s).sort
  end

  def game_strategies
    GameStrategy.where(
      strategy: strategies,
      game: games,
    )
  end

  def games_count
    games.count
  end

  private

  def fake_fills
    ["#3AAEDA", "#EFDD15", "#EC6200"]
  end
end
