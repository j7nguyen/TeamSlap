class ChangeGameRequirements < ActiveRecord::Migration
  def change
    add_column(:games, :team2_name, :string)
  end
end
