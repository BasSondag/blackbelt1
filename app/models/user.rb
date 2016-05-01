class User < ActiveRecord::Base
  has_secure_password
  has_many :brigth_ideas
  has_many :likes, dependent: :destroy
  has_many :ideas_liked, through: :likes, source: :brigth_idea

   email_regex = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
   validates :name, :email, :password, :password_confirmation, presence: true
   validates :email, format: {with: email_regex}, uniqueness: {:case_sensitive => false}
   validates :password, confirmation: true, length: {in: 8..20}
end
