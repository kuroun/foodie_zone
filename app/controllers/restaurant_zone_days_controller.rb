class RestaurantZoneDaysController < ApplicationController

  def update_create
    RestaurantZoneDay.restaurant_assigned_to_any_zones_by_day(params[:restaurant_id], params[:day_id])&.destroy
    unless(params[:zone_day_id].blank?)
      @rzd = RestaurantZoneDay.new(restaurant_id: params[:restaurant_id], zone_day_id: params[:zone_day_id])
      if @rzd.save
        redirect_to assign_restaurants_to_zones_path(day_id: params[:day_id]), notice: 'Restaurant was assigned to zone successfully.'
      else
        render template: 'zone_days/assign_restaurants_to_zones'
      end
    else
      redirect_to assign_restaurants_to_zones_path(day_id: params[:day_id]), notice: 'Restaurant was unassigned successfully.'
    end
  end
end
