require "rails_helper"

describe Player do
  describe "#cards" do
    it "returns a list of all of the cards in the player's possession" do
      expected_deck = [
        "Copper",
        "Copper",
        "Copper",
        "Copper",
        "Copper",
        "Copper",
        "Copper",
        "Estate",
        "Estate",
        "Estate",
        "Province",
        "Village",
      ]
      province = Province.new
      village = Village.new

      player = Player.new(build(:game_strategy))
      player.discard_pile.add_card province
      player.hand.add_card village

      expect(player.cards.map(&:to_s).sort).to eq(expected_deck)
    end
  end

  describe "#gain_card" do
    it "adds the card to the player's discard pile" do
      player = Player.new(build(:game_strategy))
      card = Estate.new

      player.gain(card)

      expect(player.discard_pile).to include(card)
    end
  end

  describe "#take_turn" do
    it "buys cards" do
      priority = create(:priority, card_type: "Copper", sequence: 1)
      strategy = create(:strategy, priorities: [priority])
      player = Player.new(build(:game_strategy, strategy: strategy))

      original_size = player.cards.size

      player.take_turn

      expect(player.cards.size).to be > original_size
    end

    it "moves cards from the deck to the discard pile" do
      player = Player.new(build(:game_strategy))

      player.take_turn

      expect(player.deck.cards.size).to be <= 5
      expect(player.discard_pile.cards.size).to be >= 5
      expect(player.hand.cards.size).to eq(0)
    end

    describe "#draw_cards" do
      context "when the deck is empty" do
        it "reshuffles in the discard pile" do
          player = Player.new(build(:game_strategy))
          player.deck.move_all_cards(player.discard_pile)

          player.send(:draw_cards)

          expect(player.hand.cards.size).to eq(5)
        end
      end
    end
  end

  describe "#points" do
    context "before the player has taken any turns" do
      it "returns 3" do
        player = Player.new(build(:game_strategy))

        expect(player.total_points).to eq(3)
      end
    end

    context "After the player has taken some turns" do
      it "returns the sum of their points" do
        player = Player.new(build(:game_strategy))

        3.times do
          player.take_turn
        end

        expect(player.total_points).to be > 0
      end
    end
  end

  describe "#total_money" do
    context "before the player has taken any turns" do
      it "returns 7" do
        expect(Player.new(build(:game_strategy)).total_money).to eq(7)
      end
    end
  end
end
