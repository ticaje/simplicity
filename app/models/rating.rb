class Rating < ActiveRecord::Base
  attr_accessible :name

  has_many :votes, dependent: :destroy

  validates :name, :uniqueness => true, :presence => true
end
