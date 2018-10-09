class CreateNappyPotties < ActiveRecord::Migration[5.2]
  def change
    create_table :nappy_potties do |t|
      t.integer :wet
      t.integer :bm_normal
      t.integer :bm_runny
      t.integer :bm_hard
      t.belongs_to :day

      t.timestamps
    end
  end
end
