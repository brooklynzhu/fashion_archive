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

ActiveRecord::Schema.define(version: 20160116223353) do

  create_table "admin_users", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true

  create_table "clients", force: :cascade do |t|
    t.string   "name"
    t.string   "birthday"
    t.string   "email"
    t.string   "email_assist"
    t.string   "cell_phone"
    t.string   "delivery_pref"
    t.string   "photo"
    t.integer  "collection_manager_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.string   "address"
  end

  add_index "clients", ["collection_manager_id"], name: "index_clients_on_collection_manager_id"

  create_table "collection_managers", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "collection_managers", ["email"], name: "index_collection_managers_on_email", unique: true
  add_index "collection_managers", ["reset_password_token"], name: "index_collection_managers_on_reset_password_token", unique: true

  create_table "deliveries", force: :cascade do |t|
    t.string   "date"
    t.string   "notes"
    t.integer  "client_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "deliveries", ["client_id"], name: "index_deliveries_on_client_id"

  create_table "pickups", force: :cascade do |t|
    t.string   "date"
    t.string   "notes"
    t.integer  "client_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "piececount"
  end

  add_index "pickups", ["client_id"], name: "index_pickups_on_client_id"

  create_table "pieces", force: :cascade do |t|
    t.string   "designer"
    t.string   "description"
    t.integer  "size"
    t.string   "color"
    t.string   "pattern"
    t.string   "material"
    t.string   "category"
    t.string   "sub_category"
    t.string   "location"
    t.string   "condition"
    t.integer  "client_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "photo"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  add_index "pieces", ["client_id"], name: "index_pieces_on_client_id"

end
