class DeliveryScheduleController < ApplicationController

  def index
    @zones = ZoneDay.includes(:zone, :day)
  end
end
