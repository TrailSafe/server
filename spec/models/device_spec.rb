require 'spec_helper'

describe Device do
  it { should belong_to :user }
end
