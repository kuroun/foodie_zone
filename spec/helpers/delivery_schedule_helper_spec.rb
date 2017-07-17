require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the DeliveryScheduleHelper. For example:
#
# describe DeliveryScheduleHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe DeliveryScheduleHelper, type: :helper do
  describe '#total_restaurants' do
    it 'should return the total number of restaurants assigned each day' do
      restaurant_owner1 = RestaurantOwner.create(name: 'John')
      restaurant1 = Restaurant.create(name: 'Restaurant1', restaurant_owner_id: restaurant_owner1.id)
      restaurant2 = Restaurant.create(name: 'Restaurant2', restaurant_owner_id: restaurant_owner1.id)
      monday = Day.create(name: 'Monday')
      zone1 = Zone.create(name: 'Zone 1')
      zone2 = Zone.create(name: 'Zone 2')
      zone_day1 = ZoneDay.create(zone_id: zone1.id, day_id: monday.id)
      zone_day2 = ZoneDay.create(zone_id: zone2.id, day_id: monday.id)
      rzd1 = RestaurantZoneDay.create(restaurant_id: restaurant1.id, zone_day_id: zone_day1.id)
      rzd2 = RestaurantZoneDay.create(restaurant_id: restaurant2.id, zone_day_id: zone_day2.id)

      expect(helper.total_restaurants('Monday')).to eq 2
    end
  end

  describe '#total_restaurants_each_zone' do
    it 'should return the total number of restaurants assigned to a zone each day' do
      restaurant_owner1 = RestaurantOwner.create(name: 'John')
      restaurant1 = Restaurant.create(name: 'Restaurant1', restaurant_owner_id: restaurant_owner1.id)
      restaurant2 = Restaurant.create(name: 'Restaurant2', restaurant_owner_id: restaurant_owner1.id)
      monday = Day.create(name: 'Monday')
      zone1 = Zone.create(name: 'Zone 1')
      zone2 = Zone.create(name: 'Zone 2')
      zone_day1 = ZoneDay.create(zone_id: zone1.id, day_id: monday.id)
      zone_day2 = ZoneDay.create(zone_id: zone2.id, day_id: monday.id)
      rzd1 = RestaurantZoneDay.create(restaurant_id: restaurant1.id, zone_day_id: zone_day1.id)
      rzd2 = RestaurantZoneDay.create(restaurant_id: restaurant2.id, zone_day_id: zone_day2.id)

      expect(helper.total_restaurants_each_zone(zone_day1.id)).to eq 1
      expect(helper.total_restaurants_each_zone(zone_day2.id)).to eq 1
    end
  end
end
