class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.references :user, index: true, foreign_key: true
      t.string :alias
      t.string :razon_social
      t.string :rfc
      t.string :calle_y_numero
      t.string :colonia
      t.string :municipio
      t.string :estado
      t.string :cp
      t.string :pais, default: "México"
      t.string :telefono
      t.string :email
      t.string :nombre_cobro
      t.string :telefono_cobro
      t.string :email_cobro

      t.timestamps null: false
    end
  end
end
