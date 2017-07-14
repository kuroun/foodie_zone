class AddZone < SeedMigration::Migration

  def initialize
    @zones = ['Zone 1', 'Zone 2', 'Zone 3', 'Zone 4', 'Zone 5']
  end

  def up
    @zones.each do |zone|
      Zone.create(name: zone)
    end
  end

  def down
    @zones.each do |zone|
      Zone.find_by(name: zone)&.destroy
    end 
  end
end
