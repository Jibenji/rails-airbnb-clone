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

ActiveRecord::Schema.define(version: 20170331093159) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_accounts_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_accounts_on_reset_password_token", unique: true, using: :btree
  end

  create_table "artworks", force: :cascade do |t|
    t.string   "art_category"
    t.string   "description"
    t.string   "size"
    t.string   "material_description"
    t.integer  "user_id"
    t.boolean  "framed"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.string   "photo_artwork"
    t.integer  "price"
    t.string   "title"
    t.boolean  "sold",                 default: false
    t.index ["user_id"], name: "index_artworks_on_user_id", using: :btree
  end

  create_table "purchases", force: :cascade do |t|
    t.date     "date"
    t.integer  "user_id"
    t.integer  "artwork_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["artwork_id"], name: "index_purchases_on_artwork_id", using: :btree
    t.index ["user_id"], name: "index_purchases_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "phone"
    t.string   "address"
    t.string   "city"
    t.string   "bio"
    t.string   "description"
    t.string   "alias"
    t.integer  "bank_account"
    t.boolean  "artist"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "account_id"
    t.string   "photo_avatar"
    t.string   "photo_artists_banner"
    t.index ["account_id"], name: "index_users_on_account_id", using: :btree
  end

  add_foreign_key "artworks", "users"
  add_foreign_key "purchases", "artworks"
  add_foreign_key "purchases", "users"
end
