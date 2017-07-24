require 'rails_helper'

RSpec.describe Day, type: :model do
  it { should have_many :zone_days }
  it { should have_many :zones }
  it { should validate_uniqueness_of :name }
  it { should validate_presence_of :name }
  it { should belong_to(:previous_day).class_name('Day') }
  it { should belong_to(:next_day).class_name('Day') }
end
