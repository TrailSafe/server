require 'spec_helper'

describe Activity do
  it { should have_one :device }
end
