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

ActiveRecord::Schema.define(version: 20161114175049) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "admin_users", force: :cascade do |t|
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
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "home_links", force: :cascade do |t|
    t.string   "name"
    t.string   "path"
    t.integer  "year_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "position"
    t.boolean  "visibility", default: true
  end

  add_index "home_links", ["year_id"], name: "index_home_links_on_year_id", using: :btree

  create_table "publishers", force: :cascade do |t|
    t.string   "name"
    t.string   "external_link"
    t.string   "image_name"
    t.string   "image_width"
    t.string   "image_height"
    t.integer  "year_id"
    t.boolean  "visibility",    default: true
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "publishers", ["year_id"], name: "index_publishers_on_year_id", using: :btree

  create_table "registrations", force: :cascade do |t|
    t.string   "name",                   default: "",    null: false
    t.string   "affiliation"
    t.string   "nationality",            default: "",    null: false
    t.string   "email",                  default: "",    null: false
    t.string   "phone",                  default: "",    null: false
    t.boolean  "veg",                                    null: false
    t.integer  "participation",                          null: false
    t.integer  "occupation",                             null: false
    t.boolean  "acm",                                    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "acmnum"
    t.string   "transid"
    t.integer  "year_id"
    t.boolean  "approved",               default: false
    t.string   "registration_number"
    t.string   "registration_type"
    t.string   "tshirt_preference"
    t.string   "dbamount",               default: ""
    t.integer  "attendance_choice"
    t.integer  "tutorials_choice"
    t.string   "conference_date_choice"
    t.boolean  "accomodation",           default: false
  end

  create_table "sponsors", force: :cascade do |t|
    t.string   "name"
    t.string   "external_link"
    t.string   "image_name"
    t.string   "image_width"
    t.string   "image_height"
    t.integer  "year_id"
    t.boolean  "visibility",    default: true
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sponsors", ["year_id"], name: "index_sponsors_on_year_id", using: :btree

  create_table "tabs", force: :cascade do |t|
    t.text     "content"
    t.string   "name"
    t.integer  "home_link_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "position"
    t.boolean  "visibility",   default: true
    t.boolean  "collapsible",  default: false
    t.boolean  "default_open", default: true
    t.boolean  "accordion",    default: false
  end

  add_index "tabs", ["home_link_id"], name: "index_tabs_on_home_link_id", using: :btree

  create_table "years", force: :cascade do |t|
    t.string   "value"
    t.string   "venue"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "duration"
    t.boolean  "current"
    t.text     "statscounter_snippet"
  end

end
