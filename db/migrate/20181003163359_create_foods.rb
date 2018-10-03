class CreateFoods < ActiveRecord::Migration[5.2]
  def change
    create_table :foods do |t|
      t.string :breakfast_items
      t.string :breakfast_had
      t.string :am_snack_items
      t.string :am_snack_had
      t.string :lunch_items
      t.string :lunch_had
      t.string :pm_snack_items
      t.string :pm_snack_had
      t.string :dinner_tea_items
      t.string :dinner_tea_had

      t.timestamps
    end
  end
end
