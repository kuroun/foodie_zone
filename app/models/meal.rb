class Meal < ActiveRecord::Base
  include RocketPants::Cacheable

  belongs_to :restaurant

  def self.get_all_meals zone_id, day
     Meal.where(
      "restaurant_id IN(?)",
      RestaurantZoneDay.select(:restaurant_id).where(
        "zone_day_id IN(?)",
        ZoneDay.select(:id).where(
          "zone_id = ? AND day_id = ?",
          zone_id,
          Day.find_by(name: day)
          )
        )
      )
  end
end
