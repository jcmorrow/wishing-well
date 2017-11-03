def sign_in_as(user)
  visit sign_in_path
  fill_in "Email", with: user.email
  fill_in "Password", with: user.password
  within "form" do
    click_on "Sign in"
  end
end
