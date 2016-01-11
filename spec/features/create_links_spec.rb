require 'rails_helper'

RSpec.feature "CreateLinks", type: :feature do
  scenario "logged in user creates a link" do
    login_valid_user
    click_on "Links"
    expect(current_path).to eq(links_path)

    fill_in "link[url]", with: "http://www.google.com"
    fill_in "link[title]", with: "This is Google"
    click_on "Create Link"

    link = Link.find_by(url: "http://www.google.com")

    expect(current_path).to eq(links_path)
    within "#link-#{link.id}" do
      expect(page).to have_content("This is Google")
    end
  end
end
