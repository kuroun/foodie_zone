require 'rails_helper'

RSpec.describe Restaurant, type: :model do
  it { should have_many :meals }
  it { should have_many :restaurant_zone_days }
  it { should validate_uniqueness_of :name }
end
