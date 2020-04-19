# frozen_string_literal: true

class CreateQuotations < ActiveRecord::Migration
  def change
    create_table :quotations do |t|
      t.string :nombre
      t.string :telefono
      t.string :email
      t.string :origen
      t.float :num_dias, default: 0
      t.date :fecha_inicio
      t.date :fecha_fin
      t.integer :pasajeros
      t.float :distancia, default: 0
      t.text :observaciones
      t.references :user, index: true, foreign_key: true
      t.float :segmento1, default: 0
      t.float :dia_extra1, default: 0
      t.float :segmento2, default: 0
      t.float :dia_extra2, default: 0
      t.float :segmento3, default: 0
      t.float :dia_extra3, default: 0
      t.float :segmento4, default: 0
      t.float :dia_extra4, default: 0

      t.timestamps null: false
    end
  end
end
