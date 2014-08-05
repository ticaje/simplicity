FactoryGirl.define do
  factory :user do |f|
    f.username { Faker::Name.name }
    f.email { Faker::Internet.email }
    f.password 'password123'
    f.active false
  end
end
