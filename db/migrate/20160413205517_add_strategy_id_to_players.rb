class AddStrategyIdToPlayers < ActiveRecord::Migration
  def change
    add_column :players, :strategy_id, :integer

    add_foreign_key :players, :strategies
  end
end
