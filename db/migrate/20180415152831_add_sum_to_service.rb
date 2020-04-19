# frozen_string_literal: true

class AddSumToService < ActiveRecord::Migration
  def change
    add_column :services, :suma, :integer, default: 0
  end
end
