# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :article do |f|
    f.name { Faker::Name.name }
    f.link "http://mylink.me"
    f.content { Faker::Lorem.sentence(100) }
    f.state false
    f.category_id 1
  end
  factory :invalid_article, parent: :article do |f|
    f.name nil
  end
  factory :article_with_non_existing_category, parent: :article do |f|
    f.category_id -1
  end
end
