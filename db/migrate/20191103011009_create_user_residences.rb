class CreateUserResidences < ActiveRecord::Migration[5.2]
  def change
    create_table :user_residences do |t|
      t.references :user,      foreign_key: true
      t.references :residence, foreign_key: true
      t.timestamps
    end
  end
end
