class CreateTeamAdds < ActiveRecord::Migration
  def change
    create_table :team_adds do |t|
      t.integer :league_id, null: false
      t.integer :team_id, null: false

      t.timestamps
    end
  end
end
