# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :article do |f|
    f.name { Faker::Name.name }
    f.link "http://mylink.me"
    f.content { Faker::Lorem.sentence(100) }
    f.state false
  end
end
