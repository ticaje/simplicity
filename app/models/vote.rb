class Vote < ActiveRecord::Base
  attr_accessible :rating_id, :translation_id, :user_id
end
