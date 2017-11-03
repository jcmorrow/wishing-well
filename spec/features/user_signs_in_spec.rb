require "rails_helper"

feature "User signs in" do
  scenario "by submitting the sign in form" do
    user = create(:user)
    visit sign_in_path
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    within "form" do
      click_on "Sign in"
    end

    expect(page).to have_content(user.email)
    expect(page).to have_button("Sign out")
  end
end
