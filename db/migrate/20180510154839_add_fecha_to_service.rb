class AddFechaToService < ActiveRecord::Migration
  def change
    add_column :services, :fecha, :date
  end
end
