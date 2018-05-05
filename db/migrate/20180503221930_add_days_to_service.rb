class AddDaysToService < ActiveRecord::Migration
  def change
    add_column :services, :days, :integer, default: 0.0
    add_column :services, :litros, :float, default: 0.0
    add_column :services, :km_finales, :float, default: 0.0
  end
end
