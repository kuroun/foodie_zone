require 'rails_helper'

RSpec.describe RestaurantZoneDay, type: :model do
  it { should belong_to :restaurant }
  it { should belong_to :zone_day }
end
