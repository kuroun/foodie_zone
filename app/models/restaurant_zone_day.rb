class RestaurantZoneDay < ActiveRecord::Base
  belongs_to :restaurant
  belongs_to :zone_day

  validates :restaurant, :zone_day, presence: true
  validates :restaurant_id, uniqueness: {scope: :zone_day_id}

  def self.restaurant_assigned_to_any_zones_by_day(restaurant_id, day_id)
      where("restaurant_id =? AND zone_day_id IN(?)", restaurant_id, ZoneDay.where("day_id = ?", day_id).select(:id)).first
  end
end
