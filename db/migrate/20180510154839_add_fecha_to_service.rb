# frozen_string_literal: true

class AddFechaToService < ActiveRecord::Migration
  def change
    add_column :services, :fecha, :date
  end
end
