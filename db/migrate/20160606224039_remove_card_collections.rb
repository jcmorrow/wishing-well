class RemoveCardCollections < ActiveRecord::Migration
  def change
    drop_table :cards
    drop_table :hands
    drop_table :decks
    drop_table :discard_piles
    drop_table :played_piles
  end
end
