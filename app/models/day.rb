class Day < ActiveRecord::Base
  has_many :zone_days
  has_many :zones, through: :zone_days
  belongs_to :previous_day, class_name: 'Day', foreign_key: 'previous_day_id'
  belongs_to :next_day, class_name: 'Day', foreign_key: 'next_day_id'

  validates :name, uniqueness: true
  validates :name, presence: true
end
