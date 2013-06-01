require 'spec_helper'

describe Device do
  it { should belong_to :user }
  it { should have_many :help_requests }
end
