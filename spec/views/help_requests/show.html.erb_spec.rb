require 'spec_helper'

describe "help_requests/show" do
  before(:each) do
    @help_request = assign(:help_request, stub_model(HelpRequest))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
