# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user, parent: :contact, class: 'User' do
    password 'qwertyuiop'
    password_confirmation 'qwertyuiop'
  end
end
