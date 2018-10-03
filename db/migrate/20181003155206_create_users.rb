class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :password_digest
      t.boolean :childminder
      t.string :email
      t.string :phone_number
      t.string :address

      t.timestamps
    end
  end
end
