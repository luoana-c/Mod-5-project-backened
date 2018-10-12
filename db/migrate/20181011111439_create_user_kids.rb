class CreateUserKids < ActiveRecord::Migration[5.2]
  def change
    create_table :user_kids do |t|
      t.belongs_to :user 
      t.belongs_to :kid 
      t.timestamps
    end
  end
end
