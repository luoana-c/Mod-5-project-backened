class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.string :allergies
      t.string :medications
      t.belongs_to :kid
      
      t.timestamps
    end
  end
end
