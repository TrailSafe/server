# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :activity_area, :class => 'Activity::Area' do
    activity nil
    poly ""
  end
end
