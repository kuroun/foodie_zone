require 'rails_helper'
RSpec.describe RestaurantOwner, type: :model do
  it { should have_one :restaurant }
end
