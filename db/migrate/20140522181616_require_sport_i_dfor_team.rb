class RequireSportIDforTeam < ActiveRecord::Migration
  def change
    change_column :teams, :sport_id, :integer, null: false
  end
end
