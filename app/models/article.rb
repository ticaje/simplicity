class Article < ActiveRecord::Base
  attr_accessible :category_id, :content, :link, :name, :state

  belongs_to :category
  belongs_to :author, class_name: "User"
  has_many   :translations, dependent: :destroy
  has_many   :requests, dependent: :destroy
  has_many   :requesters, class_name: "User", through: :requests

  validates :name, :uniqueness => true, :presence => true
  validates_presence_of :content, :category_id
end
