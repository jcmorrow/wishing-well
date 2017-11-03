class Game < ActiveRecord::Base
  belongs_to :match
  belongs_to :winner, class_name: "GameStrategy"
  has_many :game_strategies
  has_many :strategies, through: :game_strategies
end
