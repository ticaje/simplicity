class Article < ActiveRecord::Base
  attr_accessible :category_id, :content, :link, :name, :state

  belongs_to :category
  has_many   :translations, dependent: :destroy
  has_many   :requests, dependent: :destroy

  validates :name, :uniqueness => true, :presence => true
  validates_presence_of :content
end
