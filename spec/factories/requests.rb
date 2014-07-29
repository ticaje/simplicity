# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :request do |f|
    article
    requestype
  end
end
