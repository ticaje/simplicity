class User < ActiveRecord::Base
  attr_accessible :active, :crypted_password, :email, :email, :salt, :username
end
