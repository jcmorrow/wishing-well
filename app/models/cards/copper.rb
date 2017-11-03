class Copper < Card

  def self.cost
    0
  end

  def play!(target:)
    target.gain_money money
  end

  def money
    1
  end
end
