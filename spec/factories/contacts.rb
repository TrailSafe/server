# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :contact do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    sequence(:phone_number) { |n| "(555) 555-#{1000 + n}" }
  end
end
