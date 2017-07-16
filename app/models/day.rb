class Day < ActiveRecord::Base
  has_many :zone_days
  has_many :zones, through: :zone_days
  
  validates :name, uniqueness: true
end
