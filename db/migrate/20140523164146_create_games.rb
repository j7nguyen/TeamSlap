class CreateGames < ActiveRecord::Migration
  def change
    drop_table :game
    
    create_table :games do |t|
      t.integer :league_id
      t.datetime :date_time, null: false
      t.integer :team1_id, null: false
      t.integer :team2_id, null: false
      t.integer :team1_score
      t.integer :team2_score
      t.integer :location_id
      t.string :location_other
      
      t.timestamps
    end
  end
end
