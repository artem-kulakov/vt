class CreateBuses < ActiveRecord::Migration
  def change
    create_table :buses do |t|
      t.string :numero
      t.string :marca
      t.integer :capacidad
      t.string :modelo
      t.string :placa
      t.string :version
      t.references :user, index: true, foreign_key: true
      t.references :bus, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
