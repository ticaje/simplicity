class Request < ActiveRecord::Base
  belongs_to :article
  belongs_to :user
  # attr_accessible :title, :body
end
