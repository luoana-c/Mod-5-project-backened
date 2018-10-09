class CreateNaps < ActiveRecord::Migration[5.2]
  def change
    create_table :naps do |t|
      t.time :start
      t.time :end
      t.belongs_to :day

      t.timestamps
    end
  end
end
