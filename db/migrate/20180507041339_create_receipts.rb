# frozen_string_literal: true

class CreateReceipts < ActiveRecord::Migration
  def change
    create_table :receipts do |t|
      t.string :categoria
      t.float :cantidad
      t.string :nota
      t.date :fecha
      t.references :bus, index: true, foreign_key: true
      t.references :expense, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
