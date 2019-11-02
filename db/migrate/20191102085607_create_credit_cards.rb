class CreateCreditCards < ActiveRecord::Migration[5.2]
  def change
    create_table :credit_cards do |t|
      t.integer :card_number, null: false, unique: true
      t.date :expiration_date, null: false
      t.integer :security_number, null: false
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
