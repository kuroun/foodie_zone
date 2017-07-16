require 'rails_helper'

RSpec.describe Day, type: :model do
  it { should have_many :zone_days }
  it { should have_many :zones }
  it { should validate_uniqueness_of :name}
end
