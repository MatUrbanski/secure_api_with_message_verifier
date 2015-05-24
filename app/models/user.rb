class User < ActiveRecord::Base
  has_secure_password

  validates :email, :password_digest, presence: true
end
