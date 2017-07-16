class Restaurant < ActiveRecord::Base
  has_many :meals, dependent: :destroy
  has_many :restaurant_zone_days, dependent: :destroy

  validates :name, uniqueness: true

  scope :with_zone_days, -> {
    joins(
      "left join restaurant_zone_days on restaurants.id = restaurant_zone_days.restaurant_id
      left join zone_days on restaurant_zone_days.zone_day_id = zone_days.id
      left join zones on zone_days.zone_id = zones.id"
    ).select(
      "restaurants.id as restaurant_id,
      restaurants.name as restaurant_name,
      zone_days.id as zone_day_id,
      zones.id as zone_id,
      zones.name as zone_name")
  }


end
