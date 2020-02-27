class AddNameAndAddressColumnsToCompany < ActiveRecord::Migration[6.0]
  def change
    add_column :companies, :name, :string
    add_column :companies, :address, :string
  end
end
