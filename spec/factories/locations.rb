# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :location do
    lat { Faker::Address.latitude }
    lng { Faker::Address.longitude }
  end
end
