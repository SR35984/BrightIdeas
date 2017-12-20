class User < ActiveRecord::Base
  has_secure_password
  has_many :ideas
  has_many :likes
  has_many :ideas_liked, through: :likes, source: :idea

  before_save :setCase
  
    EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
    validates :name, :alias, presence: true, length: { minimum: 2 }
    validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
  
  def setCase
    self.name.titleize
    self.alias.titleize
    self.email.downcase!
  end
end
