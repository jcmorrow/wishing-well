class Village < Card
  def self.cost
    3
  end

  def play!(target:)
    target.draw_cards(1)
    target.gain_actions(2)
  end
end
