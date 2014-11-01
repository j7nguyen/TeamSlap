class CreateFormations < ActiveRecord::Migration
  def change
    create_table :formations do |t|
      t.string :name
      t.integer :sport_id
      t.integer :team_id

      t.timestamps
    end
  end
end
