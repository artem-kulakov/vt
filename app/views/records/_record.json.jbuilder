json.extract! record, :id, :start_time, :end_time, :initial_time, :finish_time, :title, :client_id, :user_id, :numero_pasajeros, :numero_de_camiones, :lugar_salida, :referencia_salida, :nombre_referencia, :telefono_referencia, :precio, :precio, :factura, :num_factura, :status_op, :status_admin, :observaciones, :distancia, :created_at, :updated_at
json.url record_url(record, format: :json)
