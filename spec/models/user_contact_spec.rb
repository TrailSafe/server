require 'spec_helper'

describe UserContact do
  it { should belong_to(:user) }
  it { should belong_to(:contact) }
end
