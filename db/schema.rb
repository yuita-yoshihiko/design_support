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

ActiveRecord::Schema[7.0].define(version: 2023_01_16_103721) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "design_tip_categories", force: :cascade do |t|
    t.bigint "design_tip_id"
    t.bigint "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_design_tip_categories_on_category_id"
    t.index ["design_tip_id", "category_id"], name: "index_design_tip_categories_on_design_tip_id_and_category_id", unique: true
    t.index ["design_tip_id"], name: "index_design_tip_categories_on_design_tip_id"
  end

  create_table "design_tips", force: :cascade do |t|
    t.string "title", null: false
    t.text "guidance", null: false
    t.string "url", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "likes", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "design_tip_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["design_tip_id"], name: "index_likes_on_design_tip_id"
    t.index ["user_id", "design_tip_id"], name: "index_likes_on_user_id_and_design_tip_id", unique: true
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "name", null: false
    t.string "crypted_password"
    t.string "salt"
    t.integer "role", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "design_tip_categories", "categories"
  add_foreign_key "design_tip_categories", "design_tips"
  add_foreign_key "likes", "design_tips"
  add_foreign_key "likes", "users"
end
