require 'spec_helper'

describe "calculators/edit.html.haml" do
  before(:each) do
    @calculator = assign(:calculator, stub_model(Calculator,
      :salary => 1.5,
      :employee => 1,
      :sick_days => 1.5
    ))
  end

  it "renders the edit calculator form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => calculators_path(@calculator), :method => "post" do
      assert_select "input#calculator_salary", :name => "calculator[salary]"
      assert_select "input#calculator_employee", :name => "calculator[employee]"
      assert_select "input#calculator_sick_days", :name => "calculator[sick_days]"
    end
  end
end
