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

ActiveRecord::Schema.define(version: 20160613080519) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"
  enable_extension "uuid-ossp"

  create_table "clones", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.integer  "person_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "clones", ["person_id"], name: "index_clones_on_person_id", using: :btree

  create_table "people", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.text     "nicknames",  default: [],              array: true
    t.hstore   "appearance"
  end

  create_table "therapists", force: :cascade do |t|
    t.string   "name"
    t.uuid     "clone_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "therapists", ["clone_id"], name: "index_therapists_on_clone_id", using: :btree

  add_foreign_key "clones", "people"
end
