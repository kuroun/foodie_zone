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

ActiveRecord::Schema.define(version: 20170717215757) do

  create_table "days", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "meals", force: :cascade do |t|
    t.string   "name"
    t.integer  "restaurant_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "meals", ["restaurant_id"], name: "index_meals_on_restaurant_id"

  create_table "restaurant_zone_days", force: :cascade do |t|
    t.integer  "restaurant_id"
    t.integer  "zone_day_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "restaurant_zone_days", ["restaurant_id", "zone_day_id"], name: "index_restaurant_zone_days_on_restaurant_id_and_zone_day_id", unique: true
  add_index "restaurant_zone_days", ["restaurant_id"], name: "index_restaurant_zone_days_on_restaurant_id"
  add_index "restaurant_zone_days", ["zone_day_id"], name: "index_restaurant_zone_days_on_zone_day_id"

  create_table "restaurants", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "restaurant_owner_id"
  end

  create_table "seed_migration_data_migrations", force: :cascade do |t|
    t.string   "version"
    t.integer  "runtime"
    t.datetime "migrated_on"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "auth_token"
  end

  create_table "zone_days", force: :cascade do |t|
    t.integer  "zone_id"
    t.integer  "day_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "zone_days", ["day_id"], name: "index_zone_days_on_day_id"
  add_index "zone_days", ["zone_id"], name: "index_zone_days_on_zone_id"

  create_table "zones", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
