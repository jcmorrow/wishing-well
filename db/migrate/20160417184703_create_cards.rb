class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :type
      t.references :deck, index: true, foreign_key: true

      t.timestamps
    end
  end
end
