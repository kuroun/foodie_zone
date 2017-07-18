class ZoneDaysController < ApplicationController

  def assign_restaurants_to_zones
    @day = Day.find(params[:day_id])
    @restaurants = Restaurant.all
    @zone_days = Zone.only_in_day(params[:day_id])
  end

  def adding_zones
    @available_zones = Zone.available_zones(params[:day_id])
    @day = Day.find(params[:day_id])
  end

  def added_zones

  end

  def destroy
    ZoneDay.find(params[:zone_day_id]).destroy
    respond_to do |format|
      format.html { redirect_to delivery_schedule_index_path, notice: 'Zone was successfully removed from day.' }
    end
  end
end
