# frozen_string_literal: true

json.extract! receipt, :id, :categoria, :cantidad, :nota, :fecha, :bus_id, :expense_id, :created_at, :updated_at
json.url receipt_url(receipt, format: :json)
