require 'rails_helper'

RSpec.describe Zone, type: :model do
  it { should have_many :zone_days }
  it { should have_many :days }
  it { should validate_uniqueness_of :name }
end
