require 'uri'

class Link < ActiveRecord::Base
  include ActiveModel::Validations
  validate :valid_link?

  def valid_link?
    uri = URI.parse(self.url)
    errors.add(:base, "Invalid url") unless uri.kind_of?(URI::HTTP)
  rescue URI::InvalidURIError
    false
  end
end
