class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :name, null: false
      t.string :description
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state
      t.integer :zip
      t.integer :sport_id

      t.timestamps
    end
  end
end
