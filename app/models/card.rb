class Card
  def self.cost
    0
  end

  def play!(target: nil)
    target.gain_money money
  end

  def to_s
    self.class.to_s
  end

  def money
    0
  end

  def points
    0
  end
end
