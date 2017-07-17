require 'rails_helper'

RSpec.describe ZoneDay, type: :model do
  it { should belong_to :zone }
  it { should belong_to :day }
  it { should have_many :restaurant_zone_days }
  it { should validate_presence_of :zone_id }
  it { should validate_presence_of :day_id }
  it { should validate_uniqueness_of(:zone_id).scoped_to(:day_id) }
end
