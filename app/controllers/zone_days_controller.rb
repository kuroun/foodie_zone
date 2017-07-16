class ZoneDaysController < ApplicationController

  def assign_restaurants_to_zones
    @day = Day.find(params[:day_id])
    @restaurants = Restaurant.with_zone_days
    @zone_days = ZoneDay.zones_only_in_day(params[:day_id])
  end

  def add_zone
    @available_zones = nil
    @day = Day.find(params[:day_id])
  end
end
