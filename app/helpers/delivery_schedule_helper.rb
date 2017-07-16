module DeliveryScheduleHelper
  def total_restaurants day
    RestaurantZoneDay.select("restaurant_id").where("zone_day_id IN(?)", ZoneDay.where("day_id =?", Day.find_by(name: day).id).select("id")).count
  end

  def total_restaurants_each_zone zone_day_id
    RestaurantZoneDay.select("restaurant_id").where("zone_day_id =?", zone_day_id).count
  end
end
