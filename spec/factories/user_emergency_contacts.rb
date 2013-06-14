# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user_emergency_contact, :class => 'User::EmergencyContact' do
    user nil
    contact nil
  end
end
