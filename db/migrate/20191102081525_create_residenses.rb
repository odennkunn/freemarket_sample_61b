class CreateResidenses < ActiveRecord::Migration[5.2]
  def change
    create_table :residenses do |t|
      t.integer :address_number, null: false
      t.string :municipal, null: false
      t.string :address, null: false
      t.string :building
      t.references :prefecture, foreign_key: true
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
