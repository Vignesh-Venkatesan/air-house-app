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

ActiveRecord::Schema.define(version: 20190829110646) do

  create_table "accounts", primary_key: "email", force: :cascade do |t|
    t.string   "name",            limit: 255, default: "", null: false
    t.string   "address",         limit: 255, default: ""
    t.integer  "ph_no",           limit: 8,                null: false
    t.string   "password_digest", limit: 255, default: "", null: false
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.string   "remember_token",  limit: 50
  end

  create_table "bookings", primary_key: "bookid", force: :cascade do |t|
    t.string   "regid",      limit: 100, null: false
    t.string   "email",      limit: 255, null: false
    t.integer  "guests",     limit: 4,   null: false
    t.integer  "cost",       limit: 4,   null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "bookings", ["email"], name: "fk_email", using: :btree
  add_index "bookings", ["regid"], name: "fk_regid", using: :btree

  create_table "houses", primary_key: "regid", force: :cascade do |t|
    t.string   "email",      limit: 255, null: false
    t.string   "city",       limit: 255, null: false
    t.string   "locality",   limit: 255
    t.string   "address",    limit: 255
    t.string   "housetype",  limit: 255, null: false
    t.integer  "guests",     limit: 4,   null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "cost",       limit: 4,   null: false
  end

  add_index "houses", ["email"], name: "fk_email", using: :btree

  add_foreign_key "bookings", "accounts", column: "email", primary_key: "email", name: "bookings_ibfk_2", on_update: :cascade
  add_foreign_key "bookings", "houses", column: "regid", primary_key: "regid", name: "bookings_ibfk_1", on_update: :cascade
  add_foreign_key "houses", "accounts", column: "email", primary_key: "email", name: "houses_ibfk_1", on_update: :cascade
end
