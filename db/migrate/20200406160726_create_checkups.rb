# frozen_string_literal: true

class CreateCheckups < ActiveRecord::Migration[6.0]
  def change
    create_table :checkups do |t|
      t.references :bus, foreign_key: true
      t.integer :category
      t.date :fecha_inicio
      t.date :fecha_fin
      t.string :comment

      t.timestamps
    end
  end
end
