class ZoneDay < ActiveRecord::Base
  belongs_to :zone
  belongs_to :day
  has_many :restaurant_zone_days, dependent: :destroy
  validates :zone_id, :day_id, presence: true
  validates :zone_id, uniqueness: {scope: :day_id}

  def self.bulk_create day_id, zone_ids
    zone_ids.each do |id|
      self.create(day_id: day_id, zone_id: id)
    end
  end

  def check_if_zone_exist
  end

  def check_if_day_exist
  end

end
