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

ActiveRecord::Schema.define(version: 20171129163215) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.bigint "restaurant_id"
    t.bigint "chef_id"
    t.date "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status", default: "unpaid"
    t.integer "cost_pennies", default: 0, null: false
    t.json "payment"
    t.time "start_hours"
    t.time "end_hours"
    t.index ["chef_id"], name: "index_bookings_on_chef_id"
    t.index ["restaurant_id"], name: "index_bookings_on_restaurant_id"
  end

  create_table "chefs", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "address"
    t.string "phone_number"
    t.string "experience"
    t.string "description"
    t.float "avg_rating"
    t.integer "price_pennies", default: 0, null: false
    t.integer "max_hours"
    t.string "photo"
    t.string "background_photo"
    t.index ["email"], name: "index_chefs_on_email", unique: true
    t.index ["reset_password_token"], name: "index_chefs_on_reset_password_token", unique: true
  end

  create_table "conversations", force: :cascade do |t|
    t.bigint "restaurant_id"
    t.bigint "chef_id"
    t.bigint "request_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chef_id"], name: "index_conversations_on_chef_id"
    t.index ["request_id"], name: "index_conversations_on_request_id"
    t.index ["restaurant_id"], name: "index_conversations_on_restaurant_id"
  end

  create_table "messages", force: :cascade do |t|
    t.text "body"
    t.string "author_type"
    t.bigint "author_id"
    t.boolean "read", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "conversation_id"
    t.index ["author_type", "author_id"], name: "index_messages_on_author_type_and_author_id"
    t.index ["conversation_id"], name: "index_messages_on_conversation_id"
  end

  create_table "positions", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.date "start_date"
    t.date "end_date"
    t.bigint "chef_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "restaurant_name"
    t.index ["chef_id"], name: "index_positions_on_chef_id"
  end

  create_table "requests", force: :cascade do |t|
    t.bigint "restaurant_id"
    t.integer "chef_ids", default: [], array: true
    t.date "date"
    t.string "shift"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "accepted_chef_ids", default: [], array: true
    t.integer "number_of_chefs"
    t.string "status", default: "pending"
    t.text "description"
    t.text "cost"
    t.time "start_hours"
    t.time "end_hours"
    t.index ["restaurant_id"], name: "index_requests_on_restaurant_id"
  end

  create_table "restaurants", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "address"
    t.string "phone_number"
    t.string "website_address"
    t.string "photo"
    t.string "background_photo"
    t.index ["email"], name: "index_restaurants_on_email", unique: true
    t.index ["reset_password_token"], name: "index_restaurants_on_reset_password_token", unique: true
  end

  create_table "reviews_chefs", force: :cascade do |t|
    t.integer "rating"
    t.text "comment"
    t.bigint "chef_id"
    t.bigint "booking_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["booking_id"], name: "index_reviews_chefs_on_booking_id"
    t.index ["chef_id"], name: "index_reviews_chefs_on_chef_id"
  end

  create_table "reviews_restaurants", force: :cascade do |t|
    t.integer "rating"
    t.text "comment"
    t.bigint "booking_id"
    t.bigint "restaurant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["booking_id"], name: "index_reviews_restaurants_on_booking_id"
    t.index ["restaurant_id"], name: "index_reviews_restaurants_on_restaurant_id"
  end

  add_foreign_key "bookings", "chefs"
  add_foreign_key "bookings", "restaurants"
  add_foreign_key "conversations", "chefs"
  add_foreign_key "conversations", "requests"
  add_foreign_key "conversations", "restaurants"
  add_foreign_key "messages", "conversations"
  add_foreign_key "positions", "chefs"
  add_foreign_key "requests", "restaurants"
  add_foreign_key "reviews_chefs", "bookings"
  add_foreign_key "reviews_chefs", "chefs"
  add_foreign_key "reviews_restaurants", "bookings"
  add_foreign_key "reviews_restaurants", "restaurants"
end
