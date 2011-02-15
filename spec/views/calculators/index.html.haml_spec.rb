require 'spec_helper'

describe "calculators/index.html.haml" do
  before(:each) do
    assign(:calculators, [
      stub_model(Calculator,
        :salary => 1.5,
        :employee => 1,
        :sick_days => 1.5
      ),
      stub_model(Calculator,
        :salary => 1.5,
        :employee => 1,
        :sick_days => 1.5
      )
    ])
  end

  it "renders a list of calculators" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
  end
end
