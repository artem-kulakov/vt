# frozen_string_literal: true

json.extract! bus, :id, :numero, :marca, :capacidad, :modelo, :placa, :version, :user_id, :created_at, :updated_at
json.url bus_url(bus, format: :json)
