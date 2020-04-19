# frozen_string_literal: true

class AddAttToOperator < ActiveRecord::Migration
  def change
    add_column :operators, :licencia, :string
    add_column :operators, :validez, :date
  end
end
