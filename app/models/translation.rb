class Translation < ActiveRecord::Base
  attr_accessible :article_id, :content, :link, :user_id
end
