class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.references :operator, index: true, foreign_key: true
      t.string :categoria
      t.integer :cantidad, default: 0

      t.timestamps null: false
    end
  end
end
