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

ActiveRecord::Schema.define(version: 20170724220056) do

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
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

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
    t.string   "papeles"
    t.integer  "user_id"
    t.text     "observaciones"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "operators", ["user_id"], name: "index_operators_on_user_id", using: :btree

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
    t.string   "status_admin"
    t.text     "observaciones"
    t.integer  "distancia",           default: 0
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "records", ["client_id"], name: "index_records_on_client_id", using: :btree
  add_index "records", ["user_id"], name: "index_records_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
    t.string   "puesto"
    t.string   "phone"
    t.boolean  "admin"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "buses", "users"
  add_foreign_key "clients", "users"
  add_foreign_key "operators", "users"
  add_foreign_key "records", "clients"
  add_foreign_key "records", "users"
end
