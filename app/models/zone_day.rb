class ZoneDay < ActiveRecord::Base
  belongs_to :zone
  belongs_to :day
  has_many :restaurant_zone_days, dependent: :destroy

  scope :zones_only_in_day, -> (day_id) {
    includes(:zone).where("zone_days.day_id =?", 15)
  }
end
