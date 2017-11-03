require "rails_helper"

feature "User creates strategy" do
  context "with valid priorities" do
    scenario "and sees a success message" do
      visit new_strategy_path

      fill_in "Name", with: "Big Money!"

      click_on "Create"

      expect(page).to have_content(I18n.t("forms.strategies.create.success"))
      expect(page).to have_content("Big Money!")
    end
  end
end
