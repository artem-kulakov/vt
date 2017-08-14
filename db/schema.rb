# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170814180018) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "buses", force: :cascade do |t|
    t.string   "numero"
    t.string   "marca"
    t.integer  "capacidad"
    t.string   "modelo"
    t.string   "placa"
    t.string   "version"
    t.integer  "user_id"
    t.integer  "operator_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "buses", ["operator_id"], name: "index_buses_on_operator_id", using: :btree
  add_index "buses", ["user_id"], name: "index_buses_on_user_id", using: :btree

  create_table "clients", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "alias"
    t.string   "razon_social"
    t.string   "rfc"
    t.string   "calle_y_numero"
    t.string   "colonia"
    t.string   "municipio"
    t.string   "estado"
    t.string   "cp"
    t.string   "pais",           default: "México"
    t.string   "telefono"
    t.string   "email"
    t.string   "nombre_cobro"
    t.string   "telefono_cobro"
    t.string   "email_cobro"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

  add_index "clients", ["user_id"], name: "index_clients_on_user_id", using: :btree

  create_table "operators", force: :cascade do |t|
    t.string   "nombre"
    t.string   "telefono"
    t.boolean  "papeles",       default: true
    t.integer  "user_id"
    t.text     "observaciones"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.string   "licencia"
    t.date     "validez"
  end

  add_index "operators", ["user_id"], name: "index_operators_on_user_id", using: :btree

  create_table "payments", force: :cascade do |t|
    t.string   "metodo"
    t.string   "num_recibo"
    t.date     "fecha"
    t.float    "cantidad",   default: 0.0
    t.integer  "record_id"
    t.integer  "user_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "payments", ["record_id"], name: "index_payments_on_record_id", using: :btree
  add_index "payments", ["user_id"], name: "index_payments_on_user_id", using: :btree

  create_table "places", force: :cascade do |t|
    t.integer  "quotation_id"
    t.integer  "user_id"
    t.string   "address"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "places", ["quotation_id"], name: "index_places_on_quotation_id", using: :btree
  add_index "places", ["user_id"], name: "index_places_on_user_id", using: :btree

  create_table "quotations", force: :cascade do |t|
    t.string   "nombre"
    t.string   "telefono"
    t.string   "email"
    t.string   "origen"
    t.float    "num_dias",      default: 0.0
    t.date     "fecha_inicio"
    t.date     "fecha_fin"
    t.integer  "pasajeros"
    t.float    "distancia",     default: 0.0
    t.text     "observaciones"
    t.integer  "user_id"
    t.float    "segmento1",     default: 0.0
    t.float    "dia_extra1",    default: 0.0
    t.float    "segmento2",     default: 0.0
    t.float    "dia_extra2",    default: 0.0
    t.float    "segmento3",     default: 0.0
    t.float    "dia_extra3",    default: 0.0
    t.float    "segmento4",     default: 0.0
    t.float    "dia_extra4",    default: 0.0
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "quotations", ["user_id"], name: "index_quotations_on_user_id", using: :btree

  create_table "records", force: :cascade do |t|
    t.datetime "start_time"
    t.datetime "end_time"
    t.date     "initial_time"
    t.date     "finish_time"
    t.string   "title"
    t.integer  "client_id"
    t.integer  "user_id"
    t.integer  "numero_pasajeros",    default: 0
    t.integer  "numero_de_camiones",  default: 0
    t.string   "lugar_salida"
    t.string   "referencia_salida"
    t.string   "nombre_referencia"
    t.string   "telefono_referencia"
    t.float    "precio",              default: 0.0
    t.float    "precio_final",        default: 0.0
    t.boolean  "factura",             default: false
    t.string   "num_factura"
    t.string   "status_op"
    t.boolean  "status_admin",        default: false
    t.text     "observaciones"
    t.text     "condiciones"
    t.integer  "distancia",           default: 0
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "records", ["client_id"], name: "index_records_on_client_id", using: :btree
  add_index "records", ["user_id"], name: "index_records_on_user_id", using: :btree

  create_table "routes", force: :cascade do |t|
    t.string   "place"
    t.integer  "record_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "routes", ["record_id"], name: "index_routes_on_record_id", using: :btree
  add_index "routes", ["user_id"], name: "index_routes_on_user_id", using: :btree

  create_table "services", force: :cascade do |t|
    t.integer  "bus_id"
    t.integer  "record_id"
    t.integer  "user_id"
    t.float    "caseta",           default: 0.0
    t.float    "hotel",            default: 0.0
    t.float    "viaticos",         default: 0.0
    t.float    "estacionamientos", default: 0.0
    t.float    "lavadas",          default: 0.0
    t.float    "aeropuerto",       default: 0.0
    t.float    "diesel",           default: 0.0
    t.float    "otros",            default: 0.0
    t.float    "km_inicio",        default: 0.0
    t.float    "km_fin",           default: 0.0
    t.float    "precio_unidad",    default: 0.0
    t.float    "dia_extra",        default: 0.0
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  add_index "services", ["bus_id"], name: "index_services_on_bus_id", using: :btree
  add_index "services", ["record_id"], name: "index_services_on_record_id", using: :btree
  add_index "services", ["user_id"], name: "index_services_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "name"
    t.string   "puesto"
    t.string   "phone"
    t.boolean  "admin",                  default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "buses", "operators"
  add_foreign_key "buses", "users"
  add_foreign_key "clients", "users"
  add_foreign_key "operators", "users"
  add_foreign_key "payments", "records"
  add_foreign_key "payments", "users"
  add_foreign_key "places", "quotations"
  add_foreign_key "places", "users"
  add_foreign_key "quotations", "users"
  add_foreign_key "records", "clients"
  add_foreign_key "records", "users"
  add_foreign_key "routes", "records"
  add_foreign_key "routes", "users"
  add_foreign_key "services", "buses"
  add_foreign_key "services", "records"
  add_foreign_key "services", "users"
end
