class AddPolymorphicToCards < ActiveRecord::Migration
  def change
    change_table :cards do |t|
      t.remove :deck_id

      t.references :shuffleable, polymorphic: true, index: true
    end
  end
end
