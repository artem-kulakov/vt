# frozen_string_literal: true

json.extract! client, :id, :user_id, :alias, :razon_social, :rfc, :calle_y_numero, :colonia, :municipio, :estado, :cp, :pais, :telefono, :email, :nombre_cobro, :telefono_cobro, :email_cobro, :created_at, :updated_at
json.url client_url(client, format: :json)
