class CreateFormationPositions < ActiveRecord::Migration
  def change
    create_table :formation_positions do |t|
      t.string :name
      t.integer :formation_id

      t.timestamps
    end
  end
end
