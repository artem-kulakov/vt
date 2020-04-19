# frozen_string_literal: true

class AddAttributesToUser < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :puesto, :string
    add_column :users, :phone, :string
    add_column :users, :admin, :boolean, default: false
  end
end
