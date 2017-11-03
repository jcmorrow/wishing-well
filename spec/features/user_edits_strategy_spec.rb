require "rails_helper"

feature "User edits strategy" do
  context "by changing the priority sequence" do
    scenario "and sees a success message" do
      priority = create(:priority, card_type: "Province")
      priorities = [
        priority,
        create(:priority, card_type: "Gold"),
        create(:priority, card_type: "Silver"),
      ]
      strategy = create(:strategy, priorities: priorities)

      visit edit_strategy_path strategy
      within("#edit_priority_#{priority.id}") do
        fill_in "Sequence", with: 4
        click_on "Save"
      end

      expect(page).to have_content(I18n.t("forms.priorities.update.success"))
    end

    scenario "and sees the new priority sequence" do
      priority = create(:priority, card_type: "Province")
      priorities = [
        priority,
        create(:priority, card_type: "Gold"),
        create(:priority, card_type: "Silver"),
      ]
      strategy = create(:strategy, priorities: priorities)

      visit edit_strategy_path strategy
      within("#edit_priority_#{priority.id}") do
        fill_in "Sequence", with: 4
        click_on "Save"
      end

      within("#edit_priority_#{priority.id}") do
        expect(find_field("Sequence").value).to eq("4")
      end
    end
  end
end
