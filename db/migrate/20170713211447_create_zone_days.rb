class CreateZoneDays < ActiveRecord::Migration
  def change
    create_table :zone_days do |t|
      t.references :zone, index: true, foreign_key: true
      t.references :day, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
