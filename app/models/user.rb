class User < ActiveRecord::Base
  attr_accessible :active, :crypted_password, :email, :salt, :username

  has_many :translations, dependent: :destroy
  has_many :user_requests, dependent: :destroy
  has_many :requests, through: :user_requests
  has_many :votes, dependent: :destroy

  valid_email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates_presence_of :username, :crypted_password
  validates :email, format: { with: valid_email_regex }, uniqueness: { case_sensitive: false }
  validates :username, length: { maximum: 50 }
end
