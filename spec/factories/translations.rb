# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :translation do |f|
    f.link "http://trans-mylink.me"
    f.content { Faker::Lorem.sentence(100) }
    f.association :article
    f.association :user
  end
  factory :invalid_translation, parent: :translation do |f|
    f.content nil
  end
end
