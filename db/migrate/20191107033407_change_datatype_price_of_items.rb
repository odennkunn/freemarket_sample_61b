class ChangeDatatypePriceOfItems < ActiveRecord::Migration[5.2]
  def change
    change_column :items, :price, :string
    change_column :items, :size, :string
    change_column :items, :delivery_fee, :string
  end
end
