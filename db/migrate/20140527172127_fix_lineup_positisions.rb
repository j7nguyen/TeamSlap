class FixLineupPositisions < ActiveRecord::Migration
  def change
    drop_table :lineup_positions
    
    create_table :lineup_positions do |t|
      t.integer :lineup_id, null: false
      t.string :name
      t.integer :player_id

      t.timestamps
    end
    
    add_index :lineup_positions, [:lineup_id, :player_id], unique: true
  end
end
