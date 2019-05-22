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

ActiveRecord::Schema.define(version: 2019_05_22_154709) do

  create_table "brands", force: :cascade do |t|
    t.string "name"
    t.boolean "in_grocery"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ice_creams", force: :cascade do |t|
    t.string "flavor"
    t.string "description"
    t.integer "brand_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["brand_id"], name: "index_ice_creams_on_brand_id"
    t.index ["user_id"], name: "index_ice_creams_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "stars"
    t.string "title"
    t.string "content"
    t.integer "user_id"
    t.integer "ice_cream_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ice_cream_id"], name: "index_reviews_on_ice_cream_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
