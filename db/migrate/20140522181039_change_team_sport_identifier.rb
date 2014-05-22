class ChangeTeamSportIdentifier < ActiveRecord::Migration
  def change
    remove_column :teams, :sport, :string
    add_column :teams, :sport_id, :integer
  end
end
