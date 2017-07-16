require 'rails_helper'

RSpec.describe RestaurantZoneDay, type: :model do
  it { should belong_to :restaurant }
  it { should belong_to :zone_day }
  it { should validate_presence_of :restaurant }
  it { should validate_presence_of :zone_day }
  it { should validate_uniqueness_of(:restaurant_id).scoped_to(:zone_day_id) }
end
