class CreateLineups < ActiveRecord::Migration
  def change
    drop_table :lineups
    
    create_table :lineups do |t|
      t.integer :team_id, null: false
      t.integer :game_id, null: false

      t.timestamps
    end
    
    add_index :lineups, [:team_id, :game_id], unique: true
  end
end
