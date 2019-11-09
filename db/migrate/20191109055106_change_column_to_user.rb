class ChangeColumnToUser < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :users, :residences
    remove_index :users, :residence_id
    remove_reference :users, :residence
  end
end
