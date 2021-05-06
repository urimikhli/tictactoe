class AddWinLossToPlayer < ActiveRecord::Migration[5.2]
  def change
    add_column :players, :winloss, :decimal, :precision => 6, :scale => 2
  end
end