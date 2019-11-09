class AddPrefectureIdToResidences < ActiveRecord::Migration[5.2]
  def change
    add_column :residences, :prefecture_id, :integer, null: false
  end
end
