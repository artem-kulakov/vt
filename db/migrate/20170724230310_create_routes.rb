# frozen_string_literal: true

class CreateRoutes < ActiveRecord::Migration
  def change
    create_table :routes do |t|
      t.string :place
      t.references :record, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
