# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_04_13_201118) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "buses", id: :serial, force: :cascade do |t|
    t.string "numero"
    t.string "marca"
    t.integer "capacidad"
    t.string "modelo"
    t.string "placa"
    t.string "version"
    t.integer "user_id"
    t.integer "operator_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "kms_servicio_preventivo"
    t.float "kms_servicio_correctivo"
    t.index ["operator_id"], name: "index_buses_on_operator_id"
    t.index ["user_id"], name: "index_buses_on_user_id"
  end

  create_table "buses_expenses", id: false, force: :cascade do |t|
    t.integer "bus_id", null: false
    t.integer "expense_id", null: false
  end

  create_table "checkups", force: :cascade do |t|
    t.bigint "bus_id"
    t.integer "category"
    t.date "fecha_inicio"
    t.date "fecha_fin"
    t.string "comment"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["bus_id"], name: "index_checkups_on_bus_id"
  end

  create_table "clients", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.string "alias"
    t.string "razon_social"
    t.string "rfc"
    t.string "calle_y_numero"
    t.string "colonia"
    t.string "municipio"
    t.string "estado"
    t.string "cp"
    t.string "pais", default: "México"
    t.string "telefono"
    t.string "email"
    t.string "nombre_cobro"
    t.string "telefono_cobro"
    t.string "email_cobro"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "address"
    t.index ["user_id"], name: "index_clients_on_user_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string "razon_social"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.string "address"
    t.string "industry"
    t.string "rfc"
    t.string "alias"
    t.string "company_type"
    t.string "cadena_verificacion"
    t.string "type_a_name"
    t.integer "type_a_km_cost"
    t.integer "type_a_day_cost"
    t.string "type_b_name"
    t.integer "type_b_km_cost"
    t.integer "type_b_day_cost"
    t.string "type_c_name"
    t.integer "type_c_km_cost"
    t.integer "type_c_day_cost"
    t.string "type_d_name"
    t.integer "type_d_km_cost"
    t.integer "type_d_day_cost"
  end

  create_table "expenses", id: :serial, force: :cascade do |t|
    t.string "categoria"
    t.float "cantidad", default: 0.0
    t.string "nota"
    t.integer "mes"
    t.integer "ano"
    t.date "fecha"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "gas", id: :serial, force: :cascade do |t|
    t.float "cantidad", default: 0.0
    t.integer "mes"
    t.integer "ano"
    t.date "fecha"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "company_id"
    t.index ["company_id"], name: "index_gas_on_company_id"
  end

  create_table "operators", id: :serial, force: :cascade do |t|
    t.string "nombre"
    t.string "telefono"
    t.boolean "papeles", default: true
    t.integer "user_id"
    t.text "observaciones"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "licencia"
    t.date "validez"
    t.index ["user_id"], name: "index_operators_on_user_id"
  end

  create_table "payments", id: :serial, force: :cascade do |t|
    t.string "metodo"
    t.string "num_recibo"
    t.date "fecha"
    t.float "cantidad", default: 0.0
    t.integer "record_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["record_id"], name: "index_payments_on_record_id"
    t.index ["user_id"], name: "index_payments_on_user_id"
  end

  create_table "places", id: :serial, force: :cascade do |t|
    t.integer "quotation_id"
    t.integer "user_id"
    t.string "address"
    t.float "latitude"
    t.float "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["quotation_id"], name: "index_places_on_quotation_id"
    t.index ["user_id"], name: "index_places_on_user_id"
  end

  create_table "quotations", id: :serial, force: :cascade do |t|
    t.string "nombre"
    t.string "telefono"
    t.string "email"
    t.string "origen"
    t.float "num_dias", default: 0.0
    t.date "fecha_inicio"
    t.date "fecha_fin"
    t.integer "pasajeros"
    t.float "distancia", default: 0.0
    t.text "observaciones"
    t.integer "user_id"
    t.float "segmento1", default: 0.0
    t.float "dia_extra1", default: 0.0
    t.float "segmento2", default: 0.0
    t.float "dia_extra2", default: 0.0
    t.float "segmento3", default: 0.0
    t.float "dia_extra3", default: 0.0
    t.float "segmento4", default: 0.0
    t.float "dia_extra4", default: 0.0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "status", default: 0
    t.index ["user_id"], name: "index_quotations_on_user_id"
  end

  create_table "receipts", id: :serial, force: :cascade do |t|
    t.string "categoria"
    t.float "cantidad"
    t.string "nota"
    t.date "fecha"
    t.integer "bus_id"
    t.integer "expense_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bus_id"], name: "index_receipts_on_bus_id"
    t.index ["expense_id"], name: "index_receipts_on_expense_id"
  end

  create_table "records", id: :serial, force: :cascade do |t|
    t.datetime "start_time"
    t.datetime "end_time"
    t.string "initial_time"
    t.string "finish_time"
    t.string "title"
    t.integer "client_id"
    t.integer "user_id"
    t.integer "numero_pasajeros", default: 0
    t.integer "numero_de_camiones", default: 0
    t.string "lugar_salida"
    t.string "referencia_salida"
    t.string "nombre_referencia"
    t.string "telefono_referencia"
    t.float "precio", default: 0.0
    t.float "precio_final", default: 0.0
    t.boolean "factura", default: false
    t.string "num_factura"
    t.string "status_op"
    t.boolean "status_admin", default: false
    t.text "observaciones"
    t.text "condiciones"
    t.integer "distancia", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "correo_referencia"
    t.integer "status", default: 0
    t.index ["client_id"], name: "index_records_on_client_id"
    t.index ["user_id"], name: "index_records_on_user_id"
  end

  create_table "reviews", id: :serial, force: :cascade do |t|
    t.integer "operator_id"
    t.string "categoria"
    t.integer "cantidad", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["operator_id"], name: "index_reviews_on_operator_id"
  end

  create_table "routes", id: :serial, force: :cascade do |t|
    t.string "place"
    t.integer "record_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["record_id"], name: "index_routes_on_record_id"
    t.index ["user_id"], name: "index_routes_on_user_id"
  end

  create_table "services", id: :serial, force: :cascade do |t|
    t.integer "bus_id"
    t.integer "record_id"
    t.integer "user_id"
    t.float "caseta", default: 0.0
    t.float "hotel", default: 0.0
    t.float "viaticos", default: 0.0
    t.float "estacionamientos", default: 0.0
    t.float "lavadas", default: 0.0
    t.float "aeropuerto", default: 0.0
    t.float "diesel", default: 0.0
    t.float "otros", default: 0.0
    t.float "km_inicio", default: 0.0
    t.float "km_fin", default: 0.0
    t.float "precio_unidad", default: 0.0
    t.float "dia_extra", default: 0.0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "operator_id"
    t.integer "suma", default: 0
    t.integer "days", default: 0
    t.float "litros", default: 0.0
    t.float "km_finales", default: 0.0
    t.float "rendimiento", default: 0.0
    t.date "fecha"
    t.float "factor", default: 0.0
    t.index ["bus_id"], name: "index_services_on_bus_id"
    t.index ["operator_id"], name: "index_services_on_operator_id"
    t.index ["record_id"], name: "index_services_on_record_id"
    t.index ["user_id"], name: "index_services_on_user_id"
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "puesto"
    t.string "phone"
    t.boolean "admin", default: false
    t.string "authentication_token", limit: 30
    t.bigint "company_id"
    t.boolean "super_admin"
    t.index ["authentication_token"], name: "index_users_on_authentication_token", unique: true
    t.index ["company_id"], name: "index_users_on_company_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "vouchers", id: :serial, force: :cascade do |t|
    t.integer "operator_id"
    t.string "operacion"
    t.float "cantidad", default: 0.0
    t.string "nota"
    t.integer "mes"
    t.integer "ano"
    t.date "fecha"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "bus_id"
    t.index ["bus_id"], name: "index_vouchers_on_bus_id"
    t.index ["operator_id"], name: "index_vouchers_on_operator_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "buses", "operators"
  add_foreign_key "buses", "users"
  add_foreign_key "checkups", "buses"
  add_foreign_key "clients", "users"
  add_foreign_key "gas", "companies"
  add_foreign_key "operators", "users"
  add_foreign_key "payments", "records"
  add_foreign_key "payments", "users"
  add_foreign_key "places", "quotations"
  add_foreign_key "places", "users"
  add_foreign_key "quotations", "users"
  add_foreign_key "receipts", "buses"
  add_foreign_key "receipts", "expenses"
  add_foreign_key "records", "clients"
  add_foreign_key "records", "users"
  add_foreign_key "reviews", "operators"
  add_foreign_key "routes", "records"
  add_foreign_key "routes", "users"
  add_foreign_key "services", "buses"
  add_foreign_key "services", "operators"
  add_foreign_key "services", "records"
  add_foreign_key "services", "users"
  add_foreign_key "users", "companies"
  add_foreign_key "vouchers", "buses"
  add_foreign_key "vouchers", "operators"
end
