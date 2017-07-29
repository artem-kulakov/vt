json.extract! user, :id, :name, :email, :admin, :puesto, :phone, :created_at, :updated_at
json.url user_url(user, format: :json)
