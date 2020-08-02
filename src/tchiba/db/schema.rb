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

ActiveRecord::Schema.define(version: 2020_08_02_233402) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "addresses", force: :cascade do |t|
    t.bigint "user_id"
    t.integer "number"
    t.string "street"
    t.string "suburb"
    t.string "state"
    t.integer "postcode"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_addresses_on_user_id"
  end

  create_table "blends", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.decimal "totalrating", precision: 3, scale: 2, default: "0.0"
    t.string "name"
    t.decimal "price", precision: 10, scale: 2
    t.integer "quantity"
    t.text "descrip"
    t.integer "weight"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.decimal "shipping_cost", precision: 10, scale: 2, default: "0.0"
    t.decimal "discount_amount", precision: 10, scale: 2, default: "0.0"
    t.index ["user_id"], name: "index_blends_on_user_id"
  end

  create_table "blends_properties", id: false, force: :cascade do |t|
    t.bigint "blend_id", null: false
    t.bigint "property_id", null: false
  end

  create_table "cart_items", force: :cascade do |t|
    t.bigint "cart_id", null: false
    t.bigint "blend_id", null: false
    t.integer "blend_quantity", default: 1
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["blend_id"], name: "index_cart_items_on_blend_id"
    t.index ["cart_id"], name: "index_cart_items_on_cart_id"
  end

  create_table "carts", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_carts_on_user_id"
  end

  create_table "conversations", force: :cascade do |t|
    t.bigint "to_user_id"
    t.bigint "from_user_id"
    t.bigint "blend_id"
    t.boolean "is_active", default: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["blend_id"], name: "index_conversations_on_blend_id"
    t.index ["from_user_id"], name: "index_conversations_on_from_user_id"
    t.index ["to_user_id"], name: "index_conversations_on_to_user_id"
  end

  create_table "messages", force: :cascade do |t|
    t.boolean "is_from_user", default: true
    t.text "content"
    t.bigint "conversation_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["conversation_id"], name: "index_messages_on_conversation_id"
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "buyer_id"
    t.bigint "seller_id"
    t.boolean "shipped", default: false
    t.decimal "gross", precision: 20, scale: 2
    t.decimal "discount", precision: 10, scale: 2, default: "0.0"
    t.decimal "total", precision: 20, scale: 2
    t.boolean "paid", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "cart_item_id", null: false
    t.index ["buyer_id"], name: "index_orders_on_buyer_id"
    t.index ["cart_item_id"], name: "index_orders_on_cart_item_id"
    t.index ["seller_id"], name: "index_orders_on_seller_id"
  end

  create_table "properties", force: :cascade do |t|
    t.string "name"
    t.text "descrip"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "blend_id", null: false
    t.decimal "rating", precision: 3, scale: 2
    t.text "descrip"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["blend_id"], name: "index_reviews_on_blend_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "transactions", force: :cascade do |t|
    t.bigint "order_id", null: false
    t.decimal "amount", precision: 20, scale: 2
    t.boolean "paid", default: false
    t.boolean "is_refund", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["order_id"], name: "index_transactions_on_order_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.text "name"
    t.text "bio"
    t.decimal "credit", precision: 10, scale: 2, default: "0.0"
    t.boolean "is_admin", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "addresses", "users"
  add_foreign_key "blends", "users"
  add_foreign_key "cart_items", "blends"
  add_foreign_key "cart_items", "carts"
  add_foreign_key "carts", "users"
  add_foreign_key "conversations", "users", column: "from_user_id"
  add_foreign_key "conversations", "users", column: "to_user_id"
  add_foreign_key "messages", "conversations"
  add_foreign_key "orders", "cart_items"
  add_foreign_key "orders", "users", column: "buyer_id"
  add_foreign_key "orders", "users", column: "seller_id"
  add_foreign_key "reviews", "blends"
  add_foreign_key "reviews", "users"
  add_foreign_key "transactions", "orders"
end
