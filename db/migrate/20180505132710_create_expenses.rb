# frozen_string_literal: true

class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.references :bus, index: true, foreign_key: true
      t.string :categoria
      t.float :cantidad, default: 0.0
      t.string :nota
      t.integer :mes
      t.integer :ano
      t.date :fecha

      t.timestamps null: false
    end
  end
end
