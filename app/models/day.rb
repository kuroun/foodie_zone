class Day < ActiveRecord::Base
  validates :name, uniqueness: true
  has_many :zone_days
  has_many :zones, through: :zone_days
end
