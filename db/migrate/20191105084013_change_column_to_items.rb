class ChangeColumnToItems < ActiveRecord::Migration[5.2]
  def change
    change_column_null :items, :delivery_way, false, 0
    change_column_null :items, :delivery_day, false, 0
  end
end
