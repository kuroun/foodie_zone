class ZoneDay < ActiveRecord::Base
  belongs_to :zone
  belongs_to :day
  has_many :restaurant_zone_days, dependent: :destroy
  validates :zone_id, :day_id, presence: true
  validates :zone_id, uniqueness: {scope: :day_id}

end
