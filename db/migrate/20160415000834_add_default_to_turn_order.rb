class AddDefaultToTurnOrder < ActiveRecord::Migration
  def change
    change_column :turns, :number, :integer, default: 0
  end
end
