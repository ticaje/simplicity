class Requestype < ActiveRecord::Base
  attr_accessible :name

  has_many :requests, dependent: :destroy
end
