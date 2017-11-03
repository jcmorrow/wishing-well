class RenamePlayersToGameStrategies < ActiveRecord::Migration
  def change
    rename_table :players, :game_strategies
    rename_column :turns, :player_id, :game_strategy_id
    remove_column :game_strategies, :name, :string
  end
end
