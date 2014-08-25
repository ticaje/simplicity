class Category < ActiveRecord::Base
  has_ancestry

  attr_accessible :name

  has_many :articles, dependent: :destroy

  validates :name, :uniqueness => true, :presence => true

  def total_articles
    self.articles.count
  end
end
