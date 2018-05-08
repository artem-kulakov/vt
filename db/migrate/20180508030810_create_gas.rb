class CreateGas < ActiveRecord::Migration
  def change
    create_table :gas do |t|
      t.float :cantidad, default: 0.0
      t.integer :mes
      t.integer :ano
      t.date :fecha

      t.timestamps null: false
    end
  end
end
