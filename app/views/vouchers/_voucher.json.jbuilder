json.extract! voucher, :id, :operator_id, :operacion, :cantidad, :nota, :mes, :ano, :fecha, :created_at, :updated_at
json.url voucher_url(voucher, format: :json)
