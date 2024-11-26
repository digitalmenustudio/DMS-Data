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

ActiveRecord::Schema[7.0].define(version: 2024_11_26_202735) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_trgm"
  enable_extension "plpgsql"
  enable_extension "unaccent"

  create_table "action_text_rich_texts", force: :cascade do |t|
    t.string "name", null: false
    t.text "body"
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["record_type", "record_id", "name"], name: "index_action_text_rich_texts_uniqueness", unique: true
  end

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
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "daily_visits", force: :cascade do |t|
    t.bigint "restaurant_id", null: false
    t.date "date", null: false
    t.string "weekday", null: false
    t.integer "first_time_visitors", default: 0, null: false
    t.integer "recurring_visitors", default: 0, null: false
    t.integer "minutes", default: 0, null: false
    t.integer "seconds", default: 0, null: false
    t.float "sales"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["date"], name: "index_daily_visits_on_date"
    t.index ["restaurant_id"], name: "index_daily_visits_on_restaurant_id"
  end

  create_table "insights", force: :cascade do |t|
    t.bigint "restaurant_id", null: false
    t.text "description", null: false
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["restaurant_id"], name: "index_insights_on_restaurant_id"
  end

  create_table "items", force: :cascade do |t|
    t.bigint "restaurant_id", null: false
    t.string "name", null: false
    t.string "item_type", null: false
    t.integer "clicks", default: 0, null: false
    t.integer "likes", default: 0, null: false
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["restaurant_id", "name", "item_type"], name: "index_items_on_restaurant_id_and_name_and_item_type", unique: true
    t.index ["restaurant_id"], name: "index_items_on_restaurant_id"
  end

  create_table "menu_access_logs", force: :cascade do |t|
    t.bigint "restaurant_id", null: false
    t.string "day_of_week", null: false
    t.string "time_frame", null: false
    t.integer "visitors", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["restaurant_id", "day_of_week", "time_frame"], name: "index_logs_on_restaurant_day_time", unique: true
    t.index ["restaurant_id"], name: "index_menu_access_logs_on_restaurant_id"
  end

  create_table "promotions", force: :cascade do |t|
    t.bigint "restaurant_id", null: false
    t.string "name", null: false
    t.string "title"
    t.integer "view_count", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["restaurant_id"], name: "index_promotions_on_restaurant_id"
  end

  create_table "restaurants", force: :cascade do |t|
    t.string "name"
    t.date "launch_date"
    t.string "sku"
    t.integer "total_visitors"
    t.string "average_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tab_clicks", force: :cascade do |t|
    t.bigint "restaurant_id", null: false
    t.string "tab_name", null: false
    t.integer "clicks", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["restaurant_id", "tab_name"], name: "index_tab_clicks_on_restaurant_id_and_tab_name", unique: true
    t.index ["restaurant_id"], name: "index_tab_clicks_on_restaurant_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "restaurant_id", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["restaurant_id"], name: "index_users_on_restaurant_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "daily_visits", "restaurants"
  add_foreign_key "insights", "restaurants"
  add_foreign_key "items", "restaurants"
  add_foreign_key "menu_access_logs", "restaurants"
  add_foreign_key "promotions", "restaurants"
  add_foreign_key "tab_clicks", "restaurants"
  add_foreign_key "users", "restaurants"
end
