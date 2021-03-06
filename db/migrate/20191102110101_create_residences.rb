class CreateResidences < ActiveRecord::Migration[5.2]
  def change
    create_table :residences do |t|
      t.references :user,        foreign_key: true
      t.references :prefecture,  foreign_key: true
      t.integer :address_number, null: false
      t.string :municipal,       null: false
      t.string :address,         null: false
      t.string :building
      t.timestamps
    end
  end
end
