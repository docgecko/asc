require "spec_helper"

describe CalculatorsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/calculators" }.should route_to(:controller => "calculators", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/calculators/new" }.should route_to(:controller => "calculators", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/calculators/1" }.should route_to(:controller => "calculators", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/calculators/1/edit" }.should route_to(:controller => "calculators", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/calculators" }.should route_to(:controller => "calculators", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/calculators/1" }.should route_to(:controller => "calculators", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/calculators/1" }.should route_to(:controller => "calculators", :action => "destroy", :id => "1")
    end

  end
end
