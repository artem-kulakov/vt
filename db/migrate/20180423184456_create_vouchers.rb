class CreateVouchers < ActiveRecord::Migration
  def change
    create_table :vouchers do |t|
      t.references :operator, index: true, foreign_key: true
      t.string :operacion
      t.decimal :cantidad
      t.string :nota
      t.integer :mes
      t.integer :ano
      t.date :fecha

      t.timestamps null: false
    end
  end
end
