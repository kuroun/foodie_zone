class AddDay < SeedMigration::Migration

  def initialize
    @days = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday']
  end

  def up
    @days.each do |day|
      Day.create(name: day)
    end
  end

  def down
    @days.each do |day|
      Day.find_by(name: day)&.destroy
    end
  end
end
