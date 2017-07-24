class AddPreviousAndNextDayToEachDay < SeedMigration::Migration

  def initialize
    @days = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday']
  end

  def up
    @days.each_with_index do |day, i|
      previous_day = @days[i - 1] 
      next_day = (i < @days.size - 1) ? @days[i + 1] : @days[0]
      Day.find_by(name: day)&.update(
        previous_day_id: Day.find_by(name: previous_day)&.id,
        next_day_id: Day.find_by(name: next_day)&.id
      )
    end
  end

  def down
    @days.each do |day|
      Day.find_by(name: day)&.update(
        previous_day_id: nil,
        next_day_id: nil
      )
    end
  end
end
