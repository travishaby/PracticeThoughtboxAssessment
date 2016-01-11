require 'rails_helper'

RSpec.feature "UserLogsIns", type: :feature do
  scenario "Unauthenticated user signs up" do
    visit "/users/new"
    within "#new_user" do
      expect(page).to have_content "Please enter your information to create an account."
      fill_in "user[email]", with: "test@test.com"
      fill_in "user[username]", with: "travishaby"
      fill_in "user[password]", with: "password"
      fill_in "user[password_confirmation]", with: "password"
      click_on "Create Account"
    end
    user = User.find_by(email: "test@test.com")

    expect(current_path).to eq(user_path(user))
    expect(page).to have_content("Welcome, #{user.username}")
  end
end
