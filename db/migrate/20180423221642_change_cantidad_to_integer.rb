class ChangeCantidadToInteger < ActiveRecord::Migration
  def change
  	change_column :vouchers, :cantidad, :integer
  end
end
