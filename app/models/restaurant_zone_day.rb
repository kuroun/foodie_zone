class RestaurantZoneDay < ActiveRecord::Base
  belongs_to :restaurant
  belongs_to :zone_day
end
