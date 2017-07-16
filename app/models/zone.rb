class Zone < ActiveRecord::Base
  has_many :zone_days
  has_many :days, through: :zone_days

  validates :name, uniqueness: true

  scope :zones_only_in_day, -> (day_id) {
    includes(:zone).where("zone_days.day_id =?", 15)
  }
end
