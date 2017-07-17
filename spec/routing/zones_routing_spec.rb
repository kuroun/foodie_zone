require "rails_helper"

RSpec.describe ZonesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/zones").to route_to("zones#index")
    end

    it "routes to #new" do
      expect(:get => "/zones/new").to route_to("zones#new")
    end

    it "routes to #edit" do
      expect(:get => "/zones/1/edit").to route_to("zones#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/zones").to route_to("zones#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/zones/1").to route_to("zones#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/zones/1").to route_to("zones#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/zones/1").to route_to("zones#destroy", :id => "1")
    end

  end
end
