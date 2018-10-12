class CreateSchedules < ActiveRecord::Migration[5.2]
  def change
    create_table :schedules do |t|
      t.time :monday
      t.time :tuesday
      t.time :wednesday
      t.time :thursday
      t.time :friday
      t.belongs_to :kid

      t.timestamps
    end
  end
end
