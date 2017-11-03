class Smithy < Card
  def self.cost
    4
  end

  def play!(target:)
    if target.has_action?
      target.draw_cards 4
      target.lose_action
    end
  end
end
