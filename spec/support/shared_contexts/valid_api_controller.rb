shared_context "valid api controller" do

  let(:current_user){ FactoryGirl.create :user }

  before :each do
    unless example.metadata[:valid_device] === false
      request.env['HTTP_DEVICE_ID']     = SecureRandom.uuid
    end

    unless example.metadata[:valid_authorization] === false
      ENV['API_KEY']                    = SecureRandom.hex(64)
      request.env['HTTP_AUTHORIZATION'] = ENV['API_KEY']
    end

    unless example.metadata[:valid_user] === false
      controller.stub(:current_user) { current_user }
    end

  end
end