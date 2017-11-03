require "rails_helper"

feature "User view strategies" do
  scenario "and sees all strategies" do
    strategies = create_list(:strategy, 2)

    visit strategies_path

    strategies.each do |strategy|
      expect(page).to have_link(strategy.name, href: strategy_path(strategy))
    end
  end
end
