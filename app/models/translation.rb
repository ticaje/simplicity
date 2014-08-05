class Translation < ActiveRecord::Base
  attr_accessible :article_id, :content, :link, :user_id

  belongs_to :article
  belongs_to :user
  has_many   :votes, dependent: :destroy

  validates_presence_of :content, :article, :user
end
