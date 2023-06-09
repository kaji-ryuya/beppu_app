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

ActiveRecord::Schema[7.0].define(version: 2023_07_13_183510) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookmarks", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "spa_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["spa_id"], name: "index_bookmarks_on_spa_id"
    t.index ["user_id", "spa_id"], name: "index_bookmarks_on_user_id_and_spa_id", unique: true
    t.index ["user_id"], name: "index_bookmarks_on_user_id"
  end

  create_table "spas", force: :cascade do |t|
    t.string "name"
    t.integer "spring_quality", default: 0, null: false
    t.integer "place", default: 0, null: false
    t.integer "location", default: 0, null: false
    t.integer "charactor", default: 0, null: false
    t.boolean "have_family_bath", default: false, null: false
    t.string "address"
    t.string "telephone_number"
    t.string "price"
    t.string "holiday"
    t.string "business_time"
    t.string "is_child_bathing"
    t.string "parking"
    t.string "image"
    t.text "spa_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "message"
    t.string "family_bath_info"
    t.float "lat"
    t.float "lng"
    t.string "place_id"
    t.integer "photo_no"
    t.index ["name"], name: "index_spas_on_name", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "crypted_password"
    t.string "salt"
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_token_expires_at"
    t.datetime "reset_password_email_sent_at"
    t.integer "access_count_to_reset_password_page", default: 0
    t.integer "role", default: 0, null: false
    t.integer "failed_logins_count", default: 0
    t.datetime "lock_expires_at"
    t.string "unlock_token"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token"
    t.index ["unlock_token"], name: "index_users_on_unlock_token"
  end

  add_foreign_key "bookmarks", "spas"
  add_foreign_key "bookmarks", "users"
end
