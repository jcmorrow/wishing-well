class AddOrderToTurns < ActiveRecord::Migration
  def change
    add_column :turns, :order, :integer
  end
end
