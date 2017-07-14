class ZoneDay < ActiveRecord::Base
  belongs_to :zone
  belongs_to :day
end
