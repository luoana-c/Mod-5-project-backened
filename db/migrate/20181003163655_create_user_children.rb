class CreateUserChildren < ActiveRecord::Migration[5.2]
  def change
    create_table :user_children do |t|
      t.belongs_to :user 
      t.belongs_to :child 
      t.timestamps
    end
  end
end
