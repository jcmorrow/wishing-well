class ChangeTurnOrderToNumber < ActiveRecord::Migration
  def change
    rename_column :turns, :order, :number
  end
end
