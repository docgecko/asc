require 'spec_helper'

describe "calculators/show.html.haml" do
  before(:each) do
    @calculator = assign(:calculator, stub_model(Calculator,
      :salary => 1.5,
      :employee => 1,
      :sick_days => 1.5
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1.5/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1.5/)
  end
end
