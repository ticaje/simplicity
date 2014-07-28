class Vote < ActiveRecord::Base
  attr_accessible :rating_id, :translation_id, :user_id

  belongs_to :translation
  belongs_to :user
  belongs_to :rating

end
