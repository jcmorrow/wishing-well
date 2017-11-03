class Player
  attr_reader :discard_pile, :game_strategy, :played_pile, :hand, :deck

  def initialize(game_strategy)
    @game_strategy = game_strategy
    @deck = create_deck
    @discard_pile = DiscardPile.new
    @hand = Hand.new
    @played_pile = PlayedPile.new
  end

  def cards
    deck.cards + hand.cards + discard_pile.cards + played_pile.cards
  end

  def has_action?
    @actions > 0
  end

  def lose_action
    @actions -= 1
  end

  def take_turn
    @money = 0
    @actions = 1
    draw_cards
    play_cards
    buy_cards
    discard_cards
  end

  def gain(card)
    discard_pile.add_card card
  end

  def gain_money(additional_money)
    @money += additional_money
  end

  def gain_actions(additional_actions)
    @actions += additional_actions
  end

  def total_money
    cards.sum(&:money)
  end

  def total_points
    cards.sum(&:points)
  end

  def draw_cards(cards_to_draw = 5)
    if deck.cards.count < cards_to_draw
      cards_drawn = deck.cards.size
      deck.move_all_cards(hand)
      discard_pile.move_all_cards(deck)
      deck.shuffle!
      cards_to_draw -= cards_drawn
    end
    deck.move_top_cards(cards_to_draw, hand)
  end

  def strategy
    game_strategy.strategy
  end

  private

  # service object
  def buy(card)
    # right now it just creates a new card, soon it should actually grab a card
    # from the store
    gain card.new
    @money = @money - card.cost
  end

  # service_object
  def buy_cards
    @game_strategy.strategy.priorities.each do |priority|
      if can_buy(priority.card)
        buy priority.card
      end
    end
  end

  # service object
  def play_cards
    hand.play_cards(player: self)
  end

  def discard_cards
    played_pile.move_all_cards(discard_pile)
  end

  def can_buy(card)
    @money >= card.cost
  end

  def create_deck
    deck = Deck.new
    deck.shuffle!
  end
end
