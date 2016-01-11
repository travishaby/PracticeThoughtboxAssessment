require 'rails_helper'

RSpec.describe Link, type: :model do
  describe "Valid link" do
    it "has url, title and read attributes" do
      link = Link.new(url: "http://www.google.com",
                   title: "Google",
                   read: false)
      expect(link).to be_valid
    end
  end

  describe "Invalid Link" do
    it "must have a valid url" do
      link = Link.new(url: "not@a@good.link",
                      title: "bad link")
      expect(link).to be_invalid
    end
  end
end
