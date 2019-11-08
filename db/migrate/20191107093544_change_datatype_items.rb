class ChangeDatatypeItems < ActiveRecord::Migration[5.2]
  def change
    remove_index :items, :prefecture_id
    remove_reference :items, :prefecture
  end
end
