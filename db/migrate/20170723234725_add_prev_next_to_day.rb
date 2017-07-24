class AddPrevNextToDay < ActiveRecord::Migration
  def up
    add_column :days, :previous_day_id, :integer, references: 'days'
    add_column :days, :next_day_id, :integer,references: 'days'
  end

  def down
    remove_column :days, :previous_day_id
    remove_column :days, :next_day_id
  end
end
