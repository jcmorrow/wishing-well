require "rails_helper"

feature "User views matches" do
  scenario "and sees details about all matches" do
    matches = create_list(:match, 2)

    visit matches_path

    matches.each do |match|
      expect(page).to have_link(match.name, href: match_win_rate_path(match))
    end
  end
end
