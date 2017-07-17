class Restaurant < ActiveRecord::Base
  has_many :meals, dependent: :destroy
  has_many :restaurant_zone_days, dependent: :destroy
  belongs_to :restaurant_owner, class_name: 'RestaurantOwner'

  validates :name, uniqueness: true
  validates :name, :restaurant_owner_id, presence: true

end
