require "rails_helper"

feature "User signs up" do
  scenario "by submitting the signup form" do
    visit sign_up_path
    fill_in "Email", with: "email@domain.com"
    fill_in "Password", with: "p4ssw0rd"
    click_on "Sign up"

    expect(page).to have_content("email@domain.com")
    expect(page).to have_button("Sign out")
  end
end
