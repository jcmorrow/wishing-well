class CreatePlayedPile < ActiveRecord::Migration
  def change
    create_table :played_piles do |t|
      t.references :player

      t.timestamps null: false
    end
  end
end
