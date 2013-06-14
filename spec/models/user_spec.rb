require 'spec_helper'

describe User do
  it { should have_many(:user_emergency_associations).class_name('User::EmergencyContact') }
  it { should have_many(:emergency_contacts).through(:user_emergency_associations).class_name('Contact') }
end
