require "rails_helper"

describe CreateMatch do
  describe "#perform" do
    context "when the objects are valid" do
      it "saves them to the database" do
        match = build(:match)
        create_match = CreateMatch.new(match: match)

        create_match.perform

        expect(match.persisted?).to eq(true)
      end
    end
  end

  describe "#success?" do
    context "when the objects are valid" do
      it "returns true" do
        match = build(:match)
        create_match = CreateMatch.new(match: match)

        create_match.perform

        expect(create_match.success?).to eq(true)
      end
    end

    context "when no strategies are present" do
      it "returns false" do
        match = build(:match, strategy_count: 0)
        create_match = CreateMatch.new(match: match)

        create_match.perform

        expect(create_match.success?).to eq(false)
      end
    end
  end
end
