class Requestype < ActiveRecord::Base
  attr_accessible :name

  has_many :requests, dependent: :destroy

  validates :name, :uniqueness => true, :presence => true
end
