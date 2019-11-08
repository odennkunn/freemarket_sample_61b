class ChangeDatatypePrefecture < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :residences, :prefectures
    remove_index :residences, :prefecture_id
    remove_reference :residences, :prefecture
  end
end
