class CreateOperators < ActiveRecord::Migration
  def change
    create_table :operators do |t|
      t.string :nombre
      t.string :telefono
      t.string :papeles
      t.references :user, index: true, foreign_key: true
      t.text :observaciones

      t.timestamps null: false
    end
  end
end
