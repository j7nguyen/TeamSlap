class SeparateDateTimeforGames < ActiveRecord::Migration
  def change
    remove_column :games, :date_time, :datetime
    add_column :games, :date, :string, null: false
    add_column :games, :time, :string, null: false
  end
end
