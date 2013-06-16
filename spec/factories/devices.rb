# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :device do
    uuid { SecureRandom.uuid }
    user
  end
end
