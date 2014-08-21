class Translation < ActiveRecord::Base
  attr_accessible :article_id, :content, :link, :user

  belongs_to :article
  belongs_to :user
  has_many   :votes, dependent: :destroy

  has_reputation :points, :source => :user, :source_of => { :reputation => :total_translation_points, :of => :user }, aggregated_by: :sum

  validates_presence_of :content, :article, :user

  def already_voted_by?(user)
     self.evaluators_for(:points).find{ |s| s == user } != nil
  end

  def reputation
    self.reputation_for(:points)
  end

  def self.top_votes
    find_with_reputation(:points, :all, { :order => 'points DESC' })
  end
end
