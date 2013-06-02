require 'spec_helper'

describe FactoryGirl do
  let(:geokit_lat)     { 52.199200 }
  let(:geokit_lng)     { 174.213300 }

  FactoryGirl.factories.map(&:name).each do |factory_name|
    describe ".build(:#{factory_name})" do
      it 'should be valid' do
        instance = FactoryGirl.build(factory_name)
        instance_is_valid = instance.valid?
        instance_is_valid.should be_true, instance.errors.full_messages.to_sentence
      end
    end
  end

end