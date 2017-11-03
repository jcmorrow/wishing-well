class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :name
      t.references :game, index: true, foreign_key: true
    end
  end
end
