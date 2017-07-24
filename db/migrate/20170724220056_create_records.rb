class CreateRecords < ActiveRecord::Migration
  def change
    create_table :records do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.date :initial_time
      t.date :finish_time
      t.string :title
      t.references :client, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.integer :numero_pasajeros, default: 0
      t.integer :numero_de_camiones, default: 0
      t.string :lugar_salida
      t.string :referencia_salida
      t.string :nombre_referencia
      t.string :telefono_referencia
      t.float :precio, default: 0
      t.float :precio_final, default: 0
      t.boolean :factura, default: false
      t.string :num_factura
      t.string :status_op
      t.string :status_admin
      t.text :observaciones
      t.integer :distancia, default: false

      t.timestamps null: false
    end
  end
end
