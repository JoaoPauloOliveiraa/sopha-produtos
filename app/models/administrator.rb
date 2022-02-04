class Administrator < ApplicationRecord

  validates :name, :password_hash, presence: true
  VALIDATE_EMAIL = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  validates :email, format: { with: VALIDATE_EMAIL}, uniqueness: {case_sensitive: false}, presence: true
  before_save do
    self.password_hash = BCrypt::Password.create(password_hash)
  end
  before_save do
    self.email = email.downcase
  end
end