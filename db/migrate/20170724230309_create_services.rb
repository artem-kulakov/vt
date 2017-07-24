class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.references :bus, index: true, foreign_key: true
      t.references :record, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.float :caseta
      t.float :hotel
      t.float :viaticos
      t.float :estacionamientos
      t.float :lavadas
      t.float :aeropuerto
      t.float :diesel
      t.float :otros
      t.float :km_inicio
      t.float :km_fin
      t.float :precio_unidad
      t.float :dia_extra

      t.timestamps null: false
    end
  end
end
