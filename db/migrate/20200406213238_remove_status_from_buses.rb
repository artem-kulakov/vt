class RemoveStatusFromBuses < ActiveRecord::Migration[6.0]
  def change

    remove_column :buses, :status, :integer
  end
end
