class CreateDecks < ActiveRecord::Migration
  def change
    create_table :decks do |t|
      t.references :player

      t.timestamps
    end
  end
end
