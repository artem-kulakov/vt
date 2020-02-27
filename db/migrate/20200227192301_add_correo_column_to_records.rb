class AddCorreoColumnToRecords < ActiveRecord::Migration[6.0]
  def change
    add_column :records, :correo_referencia, :string
  end
end
