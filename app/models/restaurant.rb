class Restaurant < ActiveRecord::Base
  has_many :meals, dependent: :destroy
  has_many :restaurant_zone_days, dependent: :destroy

  validates :name, uniqueness: true

end
