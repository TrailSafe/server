# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :activity do
    device
    name { [Faker::Address.city, ['Trail', 'Mountain', 'Park', 'Canyon'].sample].join(' ') }
    return_area { FactoryGirl.create :location }
    end_time { 5.hours.from_now }
  end
end
