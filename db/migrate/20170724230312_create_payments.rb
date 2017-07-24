class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.string :metodo
      t.string :num_recibo
      t.date :fecha
      t.float :cantidad, default: 0
      t.references :record, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
