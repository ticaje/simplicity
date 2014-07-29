require 'faker'

FactoryGirl.define do
  factory :user do |f|
    f.username { Faker::Name.name }
    f.email { Faker::Internet.email }
    f.crypted_password 'password123'
    f.salt 'salt123'
    f.active false
  end
end
