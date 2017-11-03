class AddGameCountToMatch < ActiveRecord::Migration
  def change
    add_column :matches, :game_count, :integer
  end
end
