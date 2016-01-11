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

  describe "Invalid User" do
    it "must have an email address" do
      user = User.new(username: "travishaby",
                      password: "password")
      expect(user).to be_invalid
    end

    it "must have a username" do
      user = User.new(email: "email@test.com",
                   password: "password")
      expect(user).to be_invalid
    end

    it "must have a password" do
      user = User.new(email: "email@test.com",
                   username: "travishaby")
      expect(user).to be_invalid
    end
  end
end
