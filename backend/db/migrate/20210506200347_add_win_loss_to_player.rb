class AddWinLossToPlayer < ActiveRecord::Migration[5.2]
  def change
    add_column :players, :winloss, :decimal, :precision => 5, :scale => 2
  end
end