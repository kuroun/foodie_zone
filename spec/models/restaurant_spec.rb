require 'rails_helper'

RSpec.describe Restaurant, type: :model do
  it { should have_many :meals }
  it { should have_many :restaurant_zone_days }
  it { should belong_to :restaurant_owner }
  it { should validate_uniqueness_of :name }
  it { should validate_presence_of :name }
  it { should validate_presence_of :restaurant_owner_id }
end
