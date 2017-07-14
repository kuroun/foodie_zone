class Restaurant < ActiveRecord::Base
  validates :name, uniqueness: true
  has_many :meals, dependent: :destroy
end
