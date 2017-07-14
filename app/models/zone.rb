class Zone < ActiveRecord::Base
  validates :name, uniqueness: true
  has_many :zone_days
  has_many :days, through: :zone_days
end
