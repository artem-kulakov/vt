json.extract! expense, :id, :bus_id, :categoria, :cantidad, :nota, :mes, :ano, :fecha, :created_at, :updated_at
json.url expense_url(expense, format: :json)
