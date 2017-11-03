class CreateDiscardPile < ActiveRecord::Migration
  def change
    create_table :discard_piles do |t|
      t.references :player, null: false, foreign_key: true

      t.timestamps
    end
  end
end
