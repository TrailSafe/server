# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :activity do
    device
    name ->{ [Faker::Address.city, ['Trail', 'Mountain', 'Park', 'Canyon'].sample].join(' ') }
  end
end
