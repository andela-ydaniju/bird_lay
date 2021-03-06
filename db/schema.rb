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

ActiveRecord::Schema.define(version: 20170106051227) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "houses", force: :cascade do |t|
    t.string   "name"
    t.string   "code"
    t.integer  "capacity"
    t.integer  "population"
    t.integer  "user_id"
    t.float    "feed_consumption"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["user_id"], name: "index_houses_on_user_id", using: :btree
  end

  create_table "mortalities", force: :cascade do |t|
    t.integer  "count"
    t.integer  "house_id"
    t.integer  "registrar_id"
    t.text     "cause"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["house_id"], name: "index_mortalities_on_house_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "name"
    t.string   "password_digest"
    t.integer  "level",           default: 0, null: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

end
