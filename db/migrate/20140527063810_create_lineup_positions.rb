class CreateLineupPositions < ActiveRecord::Migration
  def change
    create_table :lineup_positions do |t|
      t.integer :game_id, null: false
      t.string :name
      t.integer :player_id
      t.integer :team_id, null: false

      t.timestamps
    end
    
    add_index :lineup_positions, [:game_id, :player_id], unique: true
  end
end
