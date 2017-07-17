require 'rails_helper'

RSpec.describe Zone, type: :model do
  it { should have_many :zone_days }
  it { should have_many :days }
  it { should validate_uniqueness_of :name }
  it { should validate_presence_of :name }

  describe '.only_in_day' do
    it 'expect to return joined active record relation which has zone_day_id and zone_name' do
      restaurant1 = Restaurant.create(name: 'Restaurant1')
      restaurant2 = Restaurant.create(name: 'Restaurant2')
      monday = Day.create(name: 'Monday')
      zone1 = Zone.create(name: 'Zone 1')
      zone2 = Zone.create(name: 'Zone 2')
      zone_day1 = ZoneDay.create(zone_id: zone1.id, day_id: monday.id)
      zone_day2 = ZoneDay.create(zone_id: zone2.id, day_id: monday.id)
      rzd1 = RestaurantZoneDay.create(restaurant_id: restaurant1.id, zone_day_id: zone_day1.id)
      rzd2 = RestaurantZoneDay.create(restaurant_id: restaurant2.id, zone_day_id: zone_day2.id)

      expect(Zone.only_in_day(monday.id).first.zone_day_id).to eq zone_day1.id
      expect(Zone.only_in_day(monday.id).first.zone_name).to eq zone1.name
    end
  end
end
