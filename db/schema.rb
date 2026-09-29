# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.2].define(version: 2026_09_29_074505) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "burrs", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "department_id", null: false
    t.uuid "user_id", null: false
    t.decimal "amount", precision: 18, scale: 4, null: false
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["department_id"], name: "index_burrs_on_department_id"
    t.index ["user_id"], name: "index_burrs_on_user_id"
  end

  create_table "cases", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "user_id", null: false
    t.integer "type", null: false
    t.string "description"
    t.decimal "amount", precision: 18, scale: 4, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_cases_on_user_id"
  end

  create_table "departments", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "department_name", limit: 255
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "moves", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "department_id", null: false
    t.uuid "user_id", null: false
    t.decimal "amount", precision: 18, scale: 4, null: false
    t.integer "type", null: false
    t.string "description"
    t.index ["department_id"], name: "index_moves_on_department_id"
    t.index ["user_id"], name: "index_moves_on_user_id"
  end

  create_table "sessions", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "user_id", null: false
    t.string "ip_address"
    t.string "user_agent"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_sessions_on_user_id"
  end

  create_table "users", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "email_address", limit: 255, null: false
    t.string "password_digest", limit: 255, null: false
    t.string "phone", limit: 20
    t.string "name", limit: 100, null: false
    t.string "surname", limit: 100, null: false
    t.integer "role", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email_address"], name: "index_users_on_email_address", unique: true
  end

  add_foreign_key "burrs", "departments"
  add_foreign_key "burrs", "users"
  add_foreign_key "cases", "users"
  add_foreign_key "moves", "departments"
  add_foreign_key "moves", "users"
  add_foreign_key "sessions", "users"
end
