class User < ActiveRecord::Base
  attr_accessible :active, :crypted_password, :email, :email, :salt, :username

  has_many :translations, dependent: :destroy
  has_many :requests, through: :user_request
  has_many :votes, dependent: :destroy
end
