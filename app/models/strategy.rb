class Strategy < ActiveRecord::Base
  before_create :default_priorities
  has_and_belongs_to_many :matches
  has_many :game_strategies
  has_many :games, through: :game_strategies
  has_many :priorities

  DEFAULT_PRIORITIES = %w[
    Province
    Gold
    Silver
  ].freeze

  def default_priorities
    if priorities.empty?
      self.priorities = DEFAULT_PRIORITIES.map.with_index do |priority, index|
        Priority.new(card_type: priority, strategy: self, sequence: index)
      end
    end
  end
end
