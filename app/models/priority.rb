class Priority < ActiveRecord::Base
  belongs_to :card
  belongs_to :strategy

  validates :card_type, presence: true
  validates(
    :sequence,
    numericality: true,
    uniqueness: { scope: :strategy_id },
    presence: true,
  )

  default_scope -> { order("sequence ASC") }

  def card
    card_type.constantize
  end
end
