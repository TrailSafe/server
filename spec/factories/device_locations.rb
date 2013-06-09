# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :device_location, :class => 'Device::Location' do
    device nil
    latlon ""
    reported_at "2013-06-09 13:41:28"
  end
end
