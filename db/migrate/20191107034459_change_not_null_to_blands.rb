class ChangeNotNullToBlands < ActiveRecord::Migration[5.2]
  def change
    change_column_null :blands, :name, true
  end
end
