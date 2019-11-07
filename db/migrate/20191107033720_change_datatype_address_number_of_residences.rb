class ChangeDatatypeAddressNumberOfResidences < ActiveRecord::Migration[5.2]
  def change
    change_column :residences, :address_number, :string
  end
end
