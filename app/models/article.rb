class Article < ActiveRecord::Base
  attr_accessible :category_id, :content, :link, :name, :state, :author

  belongs_to :category
  belongs_to :author, class_name: "User"
  has_many   :translations, dependent: :destroy
  has_many   :requests, dependent: :destroy
  has_many   :requesters, source: :user, through: :requests

  has_reputation :points, :source => :user, :source_of => { :reputation => :total_article_points, :of => :author}, aggregated_by: :sum

  validates :name, :uniqueness => true, :presence => true
  validates_presence_of :content, :category_id

  def already_requested?(user)
    self.requesters.find_by_id(user).present?
  end

  def already_voted_by?(user)
    self.evaluators_for(:points).find{ |s| s == user } != nil
  end

  def total_requests
    self.requests.count
  end

  def total_translations
    self.translations.count
  end

  def reputation
    self.reputation_for(:points)
  end

  def self.top_requested
    select('articles.*, COUNT(requests.article_id) AS requests_count').
      joins(:requests).group('requests.article_id').order('requests_count DESC')
  end

  def self.top_translated
    select('articles.*, COUNT(translations.article_id) AS count').
      joins(:translations).group('translations.article_id').order('count DESC')
  end

  def self.not_translated
    includes(:translations).where("translations.id IS NULL")
  end

  def self.by_votes
    find_with_reputation(:points, :all, { :order => 'points DESC' })
  end

  def self.with_category(category, method)
    method = self.respond_to?(method) ? method : "top_requested"
    articles = joins(:category).where("categories.name = :category OR categories.id = :category", category: category.to_param).send(method)
  end
end
