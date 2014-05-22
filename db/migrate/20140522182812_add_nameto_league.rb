class AddNametoLeague < ActiveRecord::Migration
  def change
    add_column :leagues, :name, :string
    change_column :leagues, :name, :string, null: false
  end
end
