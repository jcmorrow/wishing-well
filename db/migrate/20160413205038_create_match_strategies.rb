class CreateMatchStrategies < ActiveRecord::Migration
  def change
    create_table :matches_strategies do |t|
      t.references :match, index: true, foreign_key: true
      t.references :strategy, index: true, foreign_key: true
    end
  end
end
