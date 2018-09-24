class AddAmountToImage < ActiveRecord::Migration[5.2]
  def change
    add_column :images, :amount, :integer
  end
end
