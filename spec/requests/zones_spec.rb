require 'rails_helper'

RSpec.describe "Zones", type: :request do
  describe "GET /zones" do
    it "works! (now write some real specs)" do
      get zones_path
      expect(response).to have_http_status(200)
    end
  end
end
