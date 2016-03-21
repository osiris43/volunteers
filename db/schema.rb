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

ActiveRecord::Schema.define(version: 20160306141632) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "organization_roles", force: :cascade do |t|
    t.integer  "organization_id"
    t.integer  "user_id"
    t.integer  "role_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "organization_roles", ["organization_id"], name: "index_organization_roles_on_organization_id", using: :btree
  add_index "organization_roles", ["role_id"], name: "index_organization_roles_on_role_id", using: :btree
  add_index "organization_roles", ["user_id"], name: "index_organization_roles_on_user_id", using: :btree

  create_table "organizations", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
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
    t.string   "name"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "volunteer_activities", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "organization_id"
    t.integer  "activity_id"
    t.decimal  "time"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "volunteer_activities", ["activity_id"], name: "index_volunteer_activities_on_activity_id", using: :btree
  add_index "volunteer_activities", ["organization_id"], name: "index_volunteer_activities_on_organization_id", using: :btree
  add_index "volunteer_activities", ["user_id"], name: "index_volunteer_activities_on_user_id", using: :btree

  add_foreign_key "organization_roles", "organizations"
  add_foreign_key "organization_roles", "roles"
  add_foreign_key "organization_roles", "users"
  add_foreign_key "volunteer_activities", "activities"
  add_foreign_key "volunteer_activities", "organizations"
  add_foreign_key "volunteer_activities", "users"
end
