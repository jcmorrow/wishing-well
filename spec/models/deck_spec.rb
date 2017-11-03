require "rails_helper"

describe Deck do
  describe "add_card" do
    context "when given a single card" do
      it "adds that card to the deck" do
        card = Estate.new
        deck = Deck.new

        deck.add_card card

        expect(deck.include?(card)).to eq(true)
      end
    end
  end

  describe "add_cards" do
    context "when given multiple cards" do
      it "adds those cards to the deck" do
        cards = [Estate.new, Copper.new]
        deck = Deck.new

        deck.add_cards cards

        cards.each do |card|
          expect(deck).to include(card)
        end
      end
    end
  end

  describe "#shuffle!" do
    it "calls shuffle! on its array of cards" do
      cards = double("cards")
      deck = Deck.new
      allow(deck).to receive(:cards).and_return(cards)

      expect(cards).to receive(:shuffle!).exactly(1).times

      deck.shuffle!
    end
  end

  context "when created with default cards" do
    it "contains 7 copper and 1 gold" do
      deck = Deck.new
      default_deck = [].tap do |d_deck|
        7.times { d_deck << "Copper" }
        3.times { d_deck << "Estate" }
      end

      expect(deck.inspect_cards).to eq(default_deck)
    end
  end

  describe "#move_top_cards" do
    it "adds the cards to the destination" do
      deck = Deck.new
      cards = deck.cards.first(5)
      hand = Hand.new

      deck.move_top_cards(5, hand)

      cards.each do |card|
        expect(hand).to include(card)
      end
    end

    it "removes the cards from the deck" do
      deck = Deck.new
      cards = deck.cards.first(5)
      hand = Hand.new

      deck.move_top_cards(5, hand)

      cards.each do |card|
        expect(deck).not_to include(card)
      end
    end
  end
end
