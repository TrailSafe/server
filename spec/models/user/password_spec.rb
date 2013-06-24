require 'spec_helper'

describe User::Password do
  context 'associations and validations' do
    it { should belong_to :user }
    it { should validate_presence_of :digest }
  end
end
