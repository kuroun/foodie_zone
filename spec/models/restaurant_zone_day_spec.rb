require 'rails_helper'

RSpec.describe RestaurantZoneDay, type: :model do
  it { should belong_to :restaurant }
  it { should belong_to :zone_day }
  it { should validate_presence_of :restaurant }
  it { should validate_presence_of :zone_day }
  it { should validate_uniqueness_of(:restaurant_id).scoped_to(:zone_day_id) }

  describe '.restaurant_assigned_to_any_zones_by_day' do
    it 'expect to return if a restaurant has been assigned to any zone in a specific day' do
      restaurant1 = Restaurant.create(name: 'Restaurant1')
      monday = Day.create(name: 'Monday')
      zone1 = Zone.create(name: 'Zone 1')
      zone_day1 = ZoneDay.create(zone_id: zone1.id, day_id: monday.id)
      rzd1 = RestaurantZoneDay.create(restaurant_id: restaurant1.id, zone_day_id: zone_day1.id)

      expect(RestaurantZoneDay.restaurant_assigned_to_any_zones_by_day(restaurant1.id, monday.id)).to eq rzd1
    end
  end
end
