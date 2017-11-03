class RenameOrderToSequence < ActiveRecord::Migration
  def change
    rename_column :priorities, :order, :sequence
  end
end
