class ZoneDaysController < ApplicationController

  def assign_restaurants_to_zones
    @day = Day.find(params[:day_id])
    @restaurants = Restaurant.all
    @zone_days = Zone.only_in_day(params[:day_id])
  end

  def add_zone
    @available_zones = nil
    @day = Day.find(params[:day_id])
  end
end
