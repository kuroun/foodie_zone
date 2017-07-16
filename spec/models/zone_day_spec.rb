require 'rails_helper'

RSpec.describe ZoneDay, type: :model do
  it { should belong_to :zone }
  it { should belong_to :day }
  it { should have_many :restaurant_zone_days }
end
