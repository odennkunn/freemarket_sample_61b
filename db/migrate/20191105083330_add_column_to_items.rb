class AddColumnToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :delivery_way, :string
    add_column :items, :delivery_day, :string
  end
end
