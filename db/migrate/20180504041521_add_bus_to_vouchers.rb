# frozen_string_literal: true

class AddBusToVouchers < ActiveRecord::Migration
  def change
    add_reference :vouchers, :bus, index: true, foreign_key: true
  end
end
