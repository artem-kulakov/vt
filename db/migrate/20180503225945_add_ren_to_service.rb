class AddRenToService < ActiveRecord::Migration
  def change
    add_column :services, :rendimiento, :float, default: 0.0
  end
end
