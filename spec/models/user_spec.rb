require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Valid user" do
    it "has an email address, username and password" do
      user = User.new(email: "email@test.com",
                   username: "travishaby",
                   password: "password")
      expect(user).to be_valid
    end
  end
end
