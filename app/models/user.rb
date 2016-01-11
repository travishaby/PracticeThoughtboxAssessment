class User < ActiveRecord::Base
  has_secure_password
  validates :email, :username, :password, presence: true
end
