class CreateNotes < ActiveRecord::Migration[5.2]
  def change
    create_table :notes do |t|
      t.string :daily_note
      t.belongs_to :day

      t.timestamps
    end
  end
end
