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

ActiveRecord::Schema[7.0].define(version: 2023_05_01_104428) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answer_design_tips", force: :cascade do |t|
    t.bigint "answer_id", null: false
    t.bigint "design_tip_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["answer_id"], name: "index_answer_design_tips_on_answer_id"
    t.index ["design_tip_id"], name: "index_answer_design_tips_on_design_tip_id"
  end

  create_table "answers", force: :cascade do |t|
    t.string "answer1", null: false
    t.string "answer2", null: false
    t.string "answer3", null: false
    t.string "answer_code", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "authentications", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "provider", null: false
    t.string "uid", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["provider", "uid"], name: "index_authentications_on_provider_and_uid"
  end

  create_table "choices", force: :cascade do |t|
    t.string "content", null: false
    t.boolean "correct", default: false, null: false
    t.bigint "quiz_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["quiz_id"], name: "index_choices_on_quiz_id"
  end

  create_table "design_tips", force: :cascade do |t|
    t.string "title", null: false
    t.text "guidance", null: false
    t.string "url", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "medium", default: 0, null: false
    t.integer "user_id"
    t.integer "day_pageview", default: 0, null: false
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

  create_table "list_design_tips", force: :cascade do |t|
    t.bigint "list_id", null: false
    t.bigint "design_tip_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["design_tip_id"], name: "index_list_design_tips_on_design_tip_id"
    t.index ["list_id"], name: "index_list_design_tips_on_list_id"
  end

  create_table "lists", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_lists_on_user_id"
  end

  create_table "notification_reads", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "notification_id", null: false
    t.boolean "checked", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["notification_id"], name: "index_notification_reads_on_notification_id"
    t.index ["user_id"], name: "index_notification_reads_on_user_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.integer "design_tip_id", null: false
    t.string "title", null: false
    t.string "url", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "quizzes", force: :cascade do |t|
    t.string "question", null: false
    t.text "commentary", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "design_tip_id", null: false
    t.integer "score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["design_tip_id"], name: "index_reviews_on_design_tip_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "taggings", force: :cascade do |t|
    t.bigint "tag_id"
    t.string "taggable_type"
    t.bigint "taggable_id"
    t.string "tagger_type"
    t.bigint "tagger_id"
    t.string "context", limit: 128
    t.datetime "created_at", precision: nil
    t.string "tenant", limit: 128
    t.index ["context"], name: "index_taggings_on_context"
    t.index ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true
    t.index ["tag_id"], name: "index_taggings_on_tag_id"
    t.index ["taggable_id", "taggable_type", "context"], name: "taggings_taggable_context_idx"
    t.index ["taggable_id", "taggable_type", "tagger_id", "context"], name: "taggings_idy"
    t.index ["taggable_id"], name: "index_taggings_on_taggable_id"
    t.index ["taggable_type", "taggable_id"], name: "index_taggings_on_taggable_type_and_taggable_id"
    t.index ["taggable_type"], name: "index_taggings_on_taggable_type"
    t.index ["tagger_id", "tagger_type"], name: "index_taggings_on_tagger_id_and_tagger_type"
    t.index ["tagger_id"], name: "index_taggings_on_tagger_id"
    t.index ["tagger_type", "tagger_id"], name: "index_taggings_on_tagger_type_and_tagger_id"
    t.index ["tenant"], name: "index_taggings_on_tenant"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "taggings_count", default: 0
    t.index ["name"], name: "index_tags_on_name", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "name", null: false
    t.string "crypted_password"
    t.string "salt"
    t.integer "role", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_token_expires_at"
    t.datetime "reset_password_email_sent_at"
    t.integer "access_count_to_reset_password_page", default: 0
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token"
  end

  add_foreign_key "answer_design_tips", "answers"
  add_foreign_key "answer_design_tips", "design_tips"
  add_foreign_key "choices", "quizzes"
  add_foreign_key "likes", "design_tips"
  add_foreign_key "likes", "users"
  add_foreign_key "list_design_tips", "design_tips"
  add_foreign_key "list_design_tips", "lists"
  add_foreign_key "lists", "users"
  add_foreign_key "notification_reads", "notifications"
  add_foreign_key "notification_reads", "users"
  add_foreign_key "reviews", "design_tips"
  add_foreign_key "reviews", "users"
  add_foreign_key "taggings", "tags"
end
