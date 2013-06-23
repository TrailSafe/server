shared_context "valid api controller" do
  before :each do
    ENV['API_KEY'] = SecureRandom.hex(64)
    request.env['HTTP_AUTHORIZATION'] = ENV['API_KEY']
    request.env['HTTP_DEVICE_ID'] = SecureRandom.uuid
  end
end