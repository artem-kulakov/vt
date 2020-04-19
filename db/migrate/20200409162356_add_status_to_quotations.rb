# frozen_string_literal: true

class AddStatusToQuotations < ActiveRecord::Migration[6.0]
  def change
    add_column :quotations, :status, :integer, default: 0
  end
end
