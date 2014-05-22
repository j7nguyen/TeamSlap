class CreateLeagues < ActiveRecord::Migration
  def change
    create_table :leagues do |t|
      t.integer :sport_id, null: false
      t.integer :league_manager_id, null: false

      t.timestamps
    end
  end
end
