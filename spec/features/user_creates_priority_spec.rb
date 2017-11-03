require "rails_helper"

feature "User creates a priority" do
  context "with valid data" do
    scenario "and sees a success message" do
      strategy = create(:strategy)

      visit strategy_path(strategy)
      click_on t("buttons.new")
      fill_in label("card_type"), with: "Smithy"
      fill_in label("sequence"), with: "4"
      click_on t("new.save")

      expect(page).to have_text(t(".create.success"))
    end
  end

  context "with invalid data" do
    scenario "and sees error messages" do
      strategy = create(:strategy)

      visit strategy_path(strategy)
      click_on t("buttons.new")
      click_on t("new.save")

      expect(page).to have_text("is not a number")
      expect(page).to have_text("can't be blank")
    end
  end

  def label(key)
    I18n.t("simple_form.labels.priority.#{key}")
  end

  def t(key)
    I18n.t("priorities.#{key}")
  end
end
