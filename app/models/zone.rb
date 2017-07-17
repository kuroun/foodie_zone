class Zone < ActiveRecord::Base
  has_many :zone_days
  has_many :days, through: :zone_days

  validates :name, uniqueness: true
  validates :name, presence: true

  scope :only_in_day, -> (day_id) {
    joins("inner join zone_days on zones.id = zone_days.zone_id")
    .where("zone_days.day_id = ?", day_id)
    .select("zone_days.id as zone_day_id, zones.name as zone_name")
  }
end
