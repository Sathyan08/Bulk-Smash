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

ActiveRecord::Schema.define(version: 20141230220731) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bulks", force: true do |t|
    t.integer  "food_id"
    t.float    "amount"
    t.float    "price"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "foods", force: true do |t|
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "unit_id"
  end

  create_table "friendships", force: true do |t|
    t.integer "user_id",     null: false
    t.integer "friendee_id", null: false
    t.boolean "accepted"
  end

  add_index "friendships", ["friendee_id"], name: "index_friendships_on_friendee_id", using: :btree
  add_index "friendships", ["user_id", "friendee_id"], name: "index_friendships_on_user_id_and_friendee_id", unique: true, using: :btree

  create_table "list_items", force: true do |t|
    t.integer  "list_id",      null: false
    t.integer  "food_id",      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "amount",       null: false
    t.float    "share"
    t.float    "portion"
    t.float    "contribution"
  end

  create_table "lists", force: true do |t|
    t.integer  "user_id",                   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "current",    default: true
    t.string   "name",                      null: false
  end

  create_table "units", force: true do |t|
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
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
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
