class AddAddressToClients < ActiveRecord::Migration[6.0]
  def change
    add_column :clients, :address, :string
  end
end
