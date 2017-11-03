require "rails_helper"

describe SimulateGame do
  context "when the match has strategies" do
    it "creates a game in the database" do
      strategies = create_list(:strategy, 2)
      match = create(:match, strategies: strategies, strategy_count: 0)

      SimulateGame.perform_now(match: match)

      expect(Game.last.strategies).to match_array(strategies)
    end

    it "creates a game strategy for each strategy" do
      match = create(:match)

      SimulateGame.perform_now(match: match)

      expect(GameStrategy.count).to eq(match.strategies.count)
    end

    it "populates some turns in the database" do
      match = create(:match)

      SimulateGame.perform_now(match: match)

      expect(Turn.count).to be > 0
    end

    it "picks a winner" do
      match = create(:match)

      SimulateGame.perform_now(match: match)

      expect(Game.first.winner).not_to be_nil
    end
  end
end
