require 'spec_helper'

describe "help_requests/edit" do
  before(:each) do
    @help_request = assign(:help_request, stub_model(HelpRequest))
  end

  it "renders the edit help_request form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", help_request_path(@help_request), "post" do
    end
  end
end
