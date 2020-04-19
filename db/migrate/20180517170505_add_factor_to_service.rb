# frozen_string_literal: true

class AddFactorToService < ActiveRecord::Migration
  def change
    add_column :services, :factor, :float, default: 0.0
  end
end
