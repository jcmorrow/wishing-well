class CardStore
  attr_reader :cards

  def initialize(cards: [])
    @cards = cards
  end

  def add_cards(new_cards)
    @cards += new_cards
  end

  def add_card(new_card)
    add_cards([new_card])
  end

  def inspect_cards
    cards.map(&:to_s).sort
  end

  def move_top_cards(number, destination)
    move_cards(cards.shift(number), destination)
  end

  def move_all_cards(destination)
    move_top_cards(cards.size, destination)
  end

  def include?(card)
    cards.include?(card)
  end

  def each_card
    cards.each do |card|
      yield card
    end
  end

  def shuffle!
    cards.shuffle!
    self
  end

  private

  attr_writer :cards

  def move_cards(cards, destination)
    destination.add_cards cards
  end
end
