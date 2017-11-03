require "rails_helper"
require "clearance/rspec"

describe TurnSummariesController do
  describe "#show" do
    context "when the format is JSON" do
      it "renders the match and win rates as JSON" do
        match = create(:match)

        get :show, match_id: match.id, format: "json"

        expect { JSON.parse response.body }.not_to raise_exception
      end
    end
  end
end
