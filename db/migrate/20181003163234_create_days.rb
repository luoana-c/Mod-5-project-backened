class CreateDays < ActiveRecord::Migration[5.2]
  def change
    create_table :days do |t|
      t.date :date
      t.time :start_time
      t.time :end_time
      t.belongs_to :kid

      t.timestamps
    end
  end
end
