require 'spec_helper'

describe User::EmergencyContact do
  it { should belong_to(:user) }
  it { should belong_to(:contact) }
end
