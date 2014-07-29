# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :translation do |f|
    f.link "http://trans-mylink.me"
    f.content { Faker::Lorem.sentence(100) }
    article
    user
  end
end
