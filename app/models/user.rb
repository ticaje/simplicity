class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :username, :email, :password, :password_confirmation, :remember_me, :active

  has_many :translations, dependent: :destroy
  has_many :user_requests, dependent: :destroy
  has_many :requests, through: :user_requests
  has_many :votes, dependent: :destroy

  validates :username, length: { maximum: 50 }, :presence => true
  validates_uniqueness_of :username
end
