class CreateTurns < ActiveRecord::Migration
  def change
    create_table :turns do |t|
      t.references :player, index: true, foreign_key: true
      t.integer :points_gained
      t.integer :money_gained
    end
  end
end
