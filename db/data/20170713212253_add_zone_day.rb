class AddZoneDay < SeedMigration::Migration

  def initialize
    @zones = []
    @days = []
    (1..5).each do |i|
      zone = Zone.find_by(name: "Zone #{i}")
      unless zone.nil?
        @zones.push(zone)
      end
    end
    days = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday']
    days.each do |d|
      day = Day.find_by(name: d)
      unless day.nil?
        @days.push(day)
      end
    end
  end

  def up
    @zones.each do |zone|
      @days.each do |day|
        ZoneDay.create(zone_id: zone.id, day_id: day.id)
      end
    end
  end

  def down
    @zones.each do |zone|
      @days.each do |day|
        zone_day = ZoneDay.where("zone_id = ? AND day_id = ?", zone.id, day.id).first
        zone_day&.destroy
      end
    end
  end
end
