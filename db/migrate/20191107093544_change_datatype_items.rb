class ChangeDatatypeItems < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :items, :prefectures
    remove_index :items, :prefecture_id
    remove_reference :items, :prefecture
  end
end
