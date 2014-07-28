class Article < ActiveRecord::Base
  attr_accessible :category_id, :content, :link, :name, :state
end
