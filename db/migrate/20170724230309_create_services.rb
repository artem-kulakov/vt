class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.references :bus, index: true, foreign_key: true
      t.references :record, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.float :caseta, default: 0
      t.float :hotel, default: 0
      t.float :viaticos, default: 0
      t.float :estacionamientos, default: 0
      t.float :lavadas, default: 0
      t.float :aeropuerto, default: 0
      t.float :diesel, default: 0
      t.float :otros, default: 0
      t.float :km_inicio, default: 0
      t.float :km_fin, default: 0
      t.float :precio_unidad, default: 0
      t.float :dia_extra, default: 0

      t.timestamps null: false
    end
  end
end
