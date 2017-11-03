class CreatePriorities < ActiveRecord::Migration
  def change
    create_table :priorities do |t|
      t.string :card_type
      t.references :strategy
      t.integer :order
      t.boolean :permanent?

      t.timestamps
    end
  end
end
