# encoding: UTF-8
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


ActiveRecord::Schema.define(version: 20150529002337) do
  create_table "answers", force: :cascade do |t|
    t.string   "body"
    t.integer  "question_id"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "answers", ["question_id"], name: "index_answers_on_question_id"
  add_index "answers", ["user_id"], name: "index_answers_on_user_id"

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "hashtags", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "hashtags_questions", id: false, force: :cascade do |t|
    t.integer "hashtag_id",  null: false
    t.integer "question_id", null: false
  end

  create_table "hobbies", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.string   "image_url"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "hobbies", ["category_id"], name: "index_hobbies_on_category_id"

  create_table "hobbies_users", id: false, force: :cascade do |t|
    t.integer "hobby_id", null: false
    t.integer "user_id",  null: false
  end

  create_table "questions", force: :cascade do |t|
    t.string   "title"
    t.string   "body"
    t.integer  "hobby_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "questions", ["hobby_id"], name: "index_questions_on_hobby_id"
  add_index "questions", ["user_id"], name: "index_questions_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "email"
    t.string   "password"
    t.string   "image_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
