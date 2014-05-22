class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name, null: false
      t.string :sport, null: false
      t.integer :manager_id, null: false
      t.integer :league_id

      t.timestamps
    end
  end
end
