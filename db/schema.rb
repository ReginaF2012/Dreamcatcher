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

ActiveRecord::Schema.define(version: 2020_07_09_184752) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "dream_symbolisms", force: :cascade do |t|
    t.bigint "dream_id"
    t.bigint "symbolism_id"
    t.text "meaning"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["dream_id"], name: "index_dream_symbolisms_on_dream_id"
    t.index ["symbolism_id"], name: "index_dream_symbolisms_on_symbolism_id"
  end

  create_table "dreams", force: :cascade do |t|
    t.text "content"
    t.string "title"
    t.boolean "is_public"
    t.string "dream_type"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_dreams_on_user_id"
  end

  create_table "symbolisms", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "dream_symbolisms", "dreams"
  add_foreign_key "dream_symbolisms", "symbolisms"
end
