# frozen_string_literal: true

class AddStatusToRecords < ActiveRecord::Migration[6.0]
  def change
    add_column :records, :status, :integer, default: 0
  end
end
