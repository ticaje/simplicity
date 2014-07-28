class Category < ActiveRecord::Base
  has_ancestry

  attr_accessible :name

  has_many :articles, dependent: :destroy
end
