class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string  :name, null: false
      t.text  :explanation, null: false
      t.integer :price, null:false
      t.integer :size, null:false
      t.string :status, null:false
      t.integer :delivery_fee, null:false
      t.references :prefecture, foreign_key: true
      t.references :user, foreign_key: true
      t.references :category, foreign_key: true
      t.references :bland, foreign_key: true
      t.timestamps
    end
  end
end
