require 'rails_helper'

RSpec.feature "UserLogsIns", type: :feature do
  scenario "Unauthenticated user sings up" do
    visit "/"
    expect(page).to have_content "Sign Up or Log In"
    click_on "Sign Up"

    within "#sign-up-form" do
      expect(page).to have_content "Please enter your information to create an account."
      fill_in "user[email]", with: "test@test.com"
      fill_in "user[username]", with: "travishaby"
      fill_in "user[password]", with: "password"
      fill_in "user[password_confirmation]", with: "password"
      click_on "Create Account"
    end
  end
end
