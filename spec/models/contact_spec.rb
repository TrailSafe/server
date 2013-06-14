require 'spec_helper'

describe Contact do
  it { should have_many(:contact_emergency_associations).class_name('User::EmergencyContact') }
  it { should have_many(:contactable_for_users).through(:contact_emergency_associations).class_name('User') }
end
