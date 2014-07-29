# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user_request do
    user
    request
  end
end
