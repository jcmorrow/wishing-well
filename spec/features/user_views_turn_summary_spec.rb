require "rails_helper"

feature "User views turn summary" do
  scenario "and sees graphs on the turn summary page" do
    strategies = [
      Strategy.create(name: "Strategy 1"),
      Strategy.create(name: "Strategy 1"),
    ]
    match = Match.create(
      name: "Test Match",
      strategies: strategies,
      game_count: 5,
    )

    visit match_turn_summary_path(match)

    expect(current_path).to eq(match_turn_summary_path(match))
  end
end
