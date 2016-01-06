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

ActiveRecord::Schema.define(version: 20150927015619) do

  create_table "messages", force: :cascade do |t|
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.text     "content",     limit: 65535
    t.integer  "user_id",     limit: 4
    t.integer  "sender_id",   limit: 4
    t.integer  "receiver_id", limit: 4
    t.integer  "project_id",  limit: 4
  end

  add_index "messages", ["project_id"], name: "index_messages_on_project_id", using: :btree
  add_index "messages", ["receiver_id"], name: "index_messages_on_receiver_id", using: :btree
  add_index "messages", ["sender_id", "receiver_id", "created_at"], name: "index_messages_on_sender_id_and_receiver_id_and_created_at", using: :btree
  add_index "messages", ["sender_id"], name: "index_messages_on_sender_id", using: :btree

  create_table "project_categories", force: :cascade do |t|
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.string   "project_category", limit: 255
  end

  add_index "project_categories", ["project_category"], name: "index_project_categories_on_project_category", using: :btree

  create_table "project_skills", force: :cascade do |t|
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "project_id", limit: 4
    t.integer  "skill_id",   limit: 4
  end

  add_index "project_skills", ["project_id"], name: "index_project_skills_on_project_id", using: :btree
  add_index "project_skills", ["skill_id"], name: "index_project_skills_on_skill_id", using: :btree

  create_table "projects", force: :cascade do |t|
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "name",                limit: 255
    t.text     "public_description",  limit: 65535
    t.text     "private_description", limit: 65535
    t.integer  "project_category_id", limit: 4
    t.integer  "user_id",             limit: 4
  end

  create_table "skill_categories", force: :cascade do |t|
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "category",   limit: 255
  end

  add_index "skill_categories", ["category"], name: "index_skill_categories_on_category", using: :btree

  create_table "skills", force: :cascade do |t|
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.string   "skill",             limit: 255
    t.integer  "skill_category_id", limit: 4
  end

  create_table "user_projects", force: :cascade do |t|
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "user_id",    limit: 4
    t.integer  "project_id", limit: 4
    t.integer  "status",     limit: 4
  end

  add_index "user_projects", ["project_id"], name: "index_user_projects_on_project_id", using: :btree
  add_index "user_projects", ["user_id"], name: "index_user_projects_on_user_id", using: :btree

  create_table "user_skills", force: :cascade do |t|
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "user_id",    limit: 4
    t.integer  "skill_id",   limit: 4
  end

  add_index "user_skills", ["skill_id"], name: "index_user_skills_on_skill_id", using: :btree
  add_index "user_skills", ["user_id"], name: "index_user_skills_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "username",               limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
