class ChangeCantidadToFloat < ActiveRecord::Migration
  def change
  	change_column :vouchers, :cantidad, :float
  end
end
