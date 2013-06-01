require 'spec_helper'

describe "help_requests/index" do
  before(:each) do
    assign(:help_requests, [
      stub_model(HelpRequest),
      stub_model(HelpRequest)
    ])
  end

  it "renders a list of help_requests" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
