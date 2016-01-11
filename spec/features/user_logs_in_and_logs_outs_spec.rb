require 'rails_helper'

RSpec.feature "UserLogsInAndLogsOut", type: :feature do
  scenario "Existing user logs in and logs out" do
    visit "/"
    expect(page).to have_content("Please Sign Up or Log In")
    click_on "Log In"
    user = User.create(email: "test@test.com",
                    username: "travishaby",
                    password: "password")
    visit login_path

    fill_in "login[username]", with: "travishaby"
    fill_in "login[password]", with: "password"

    click_on "Log In"
    expect(current_path).to eq(user_path(user))
    expect(page).to have_content("Welcome, #{user.username}")
  end

end
