class AddAddressAndTelephoneToLocations < ActiveRecord::Migration
  def change
    remove_column :locations, :address
    add_column :locations, :address1, :string
    add_column :locations, :address2, :string
    add_column :locations, :tel, :string
  end
end
