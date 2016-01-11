require 'rails_helper'

RSpec.describe Link, type: :model do
  describe "Valid link" do
    it "has url, title and read attributes" do
      link = Link.new(url: "http://www.google.com",
                   title: "Google",
                   read: false)
      expect(link).to be_valid
    end
    it "has default read value of false" do
      link = Link.create(url: "http://www.google.com",
                   title: "Google")
      expect(link.read).to eq(false)
    end
  end

  describe "Invalid Link" do
    it "must have a valid url" do
      link = Link.new(url: "not@a@good.link",
                      title: "bad link")
      expect(link).to be_invalid
    end
    it "must have a url" do
      link = Link.new(title: "bad link")
      expect(link).to be_invalid
    end
    it "must have a title" do
      link = Link.new(url: "not@a@good.link")
      expect(link).to be_invalid
    end
  end
end
