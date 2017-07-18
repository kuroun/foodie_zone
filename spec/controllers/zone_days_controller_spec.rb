require 'rails_helper'

RSpec.describe ZoneDaysController, type: :controller do
  describe "GET #assign_restaurants_to_zones" do
    it "returns http success" do
      monday = Day.create(name: 'Monday')
      get :assign_restaurants_to_zones, day_id: monday.id
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #add_zone" do
    it "returns http success" do
      monday = Day.create(name: 'Monday')
      xhr :get, :adding_zones, day_id: monday.id, format: 'js'
      expect(response).to have_http_status(:success)
    end
  end
end
