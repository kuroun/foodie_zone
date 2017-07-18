class DeliveryScheduleController < ApplicationController

  def index
    @zone_days = ZoneDay.includes(:zone, :day)
  end
end
