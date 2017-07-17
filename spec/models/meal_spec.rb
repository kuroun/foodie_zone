require 'rails_helper'

RSpec.describe Meal, type: :model do
  it { should belong_to :restaurant }

  describe '.get_all_meals' do
    it 'expect to return all meal for specific zone and day' do
      restaurant1 = Restaurant.create(name: 'Restaurant1')
      restaurant2 = Restaurant.create(name: 'Restaurant2')
      meal1 = Meal.create(name: 'Meal1', restaurant_id: restaurant1.id)
      meal2 = Meal.create(name: 'Meal2', restaurant_id: restaurant1.id)
      meal3 = Meal.create(name: 'Meal3', restaurant_id: restaurant2.id)
      meal4 = Meal.create(name: 'Meal4', restaurant_id: restaurant2.id)
      monday = Day.create(name: 'Monday')
      tuesday = Day.create(name: 'Tuesday')
      zone1 = Zone.create(name: 'Zone 1')
      zone_day1 = ZoneDay.create(zone_id: zone1.id, day_id: monday.id)
      zone_day2 = ZoneDay.create(zone_id: zone1.id, day_id: tuesday.id)
      rzd1 = RestaurantZoneDay.create(restaurant_id: restaurant1.id, zone_day_id: zone_day1.id)
      rzd2 = RestaurantZoneDay.create(restaurant_id: restaurant2.id, zone_day_id: zone_day2.id)

      expect(Meal.get_all_meals(zone1.id, monday.name)).to include(meal1, meal2)
      expect(Meal.get_all_meals(zone1.id, tuesday.name)).to include(meal3, meal4)
    end
  end
end
