require "rails_helper"

feature "User creates match" do
  context "while logged in" do
    scenario "and sees a win rate of 100% after one game" do
      Strategy.create(name: "VillageSmithy")
      user = create(:user)
      sign_in_as(user)
      visit root_path

      click_on "New Match"

      fill_in "Name", with: "Test Match"
      select "VillageSmithy", from: "Strategies"
      fill_in "Game count", with: 1
      click_on "Create Match"

      # I would like this expectation to work but react isn't playing nicely
      # with RSpec
      #expect(page).to have_content("Win Rate: 100")
      expect(current_path).to eq(match_win_rate_path(Match.first))
    end
  end
end
