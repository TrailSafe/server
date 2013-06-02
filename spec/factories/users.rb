# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user, parent: :contact, class: 'User' do
    emergency_contact { FactoryGirl.create(:contact) }
  end
end
