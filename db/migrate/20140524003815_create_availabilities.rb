class CreateAvailabilities < ActiveRecord::Migration
  def change
    create_table :availabilities do |t|
      t.integer :player_id, null: false
      t.integer :game_id, null: false
      t.integer :available_value, null: false

      t.timestamps
    end
    
    add_index :availabilities, :player_id
    add_index :availabilities, :game_id
    add_index :availabilities, [:player_id, :game_id], unique: true
  end
end
