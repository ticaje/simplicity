class Request < ActiveRecord::Base
  attr_accessible :article_id, :requestype_id

  belongs_to :article
  belongs_to :requestype
  has_many   :user_requests, dependent: :destroy
  has_many   :users, through: :user_requests
end
