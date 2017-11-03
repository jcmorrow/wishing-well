class GameStrategy < ActiveRecord::Base
  belongs_to :game
  belongs_to :strategy
  has_many :turns
  validates_presence_of :game
  validates_presence_of :strategy
end
