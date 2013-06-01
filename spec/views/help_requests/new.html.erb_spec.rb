require 'spec_helper'

describe "help_requests/new" do
  before(:each) do
    assign(:help_request, stub_model(HelpRequest).as_new_record)
  end

  it "renders new help_request form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", help_requests_path, "post" do
    end
  end
end
