class Turn < ActiveRecord::Base
  belongs_to :game_strategy
  has_one :game, through: :game_strategy
  has_one :strategy, through: :game_strategy
end
