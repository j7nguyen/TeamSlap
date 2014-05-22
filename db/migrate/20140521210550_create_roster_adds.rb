class CreateRosterAdds < ActiveRecord::Migration
  def change
    create_table :roster_adds do |t|
      t.integer :team_id, null: false
      t.integer :player_id, null: false
      
      t.timestamps
    end
  end
end
