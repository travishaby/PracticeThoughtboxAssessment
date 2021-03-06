require 'rails_helper'

RSpec.feature "MarkLinkAsReads", type: :feature, js: true do

  scenario "user marks a link as read" do
    login_valid_user

    link = Link.create(url: "http://www.apple.com",
                      title: "This is Apple")
    expect(link.read?).to eq(false)
    visit links_path

    within "#link-#{link.id}" do
      expect(page).to have_content("This is Apple")
      click_on("Mark as Read")
      expect(page).to have_content("Read? true")
    end
    link = Link.find_by(url: "http://www.apple.com")
    expect(link.read?).to eq(true)
  end
  scenario "user marks read link as unread" do
    login_valid_user
    link = Link.create(url: "http://www.google.com",
                      title: "This is Google",
                      read: true)
    visit links_path

    within "#link-#{link.id}" do
      expect(page).to have_content("This is Google")
      click_on("Mark as Unread")
      expect(page).to have_content("Read? false")
    end
    link = Link.find_by(url: "http://www.google.com")
    expect(link.read?).to eq(false)
  end

end
