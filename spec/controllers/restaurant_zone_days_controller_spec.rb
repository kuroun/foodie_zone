require 'rails_helper'

RSpec.describe RestaurantZoneDaysController, type: :controller do

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #bulk_create" do
    it "returns http success" do
      get :bulk_create
      expect(response).to have_http_status(:success)
    end
  end

end
