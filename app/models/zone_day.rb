class ZoneDay < ActiveRecord::Base
  belongs_to :zone
  belongs_to :day
  has_many :restaurant_zone_days, dependent: :destroy

end
