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

ActiveRecord::Schema.define(version: 20150719162309) do

  create_table "comic_vine_series", force: :cascade do |t|
    t.string   "name",       null: false
    t.string   "year",       null: false
    t.string   "publisher"
    t.string   "status",     null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "configs", force: :cascade do |t|
    t.string "var"
    t.string "value"
  end

  create_table "issues", force: :cascade do |t|
    t.string   "path",       null: false
    t.string   "filename",   null: false
    t.string   "name",       null: false
    t.string   "year"
    t.integer  "number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "issues", ["path", "filename"], name: "index_issues_on_path_and_filename", unique: true

  create_table "pending_issues", force: :cascade do |t|
    t.integer  "issue_id",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "pending_issues", ["issue_id"], name: "index_pending_issues_on_issue_id"

  create_table "settings", force: :cascade do |t|
    t.string "var"
    t.string "value"
  end

  create_table "unmatched_issues", force: :cascade do |t|
    t.integer  "issue_id",             null: false
    t.integer  "comic_vine_series_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "unmatched_issues", ["comic_vine_series_id"], name: "index_unmatched_issues_on_comic_vine_series_id"
  add_index "unmatched_issues", ["issue_id"], name: "index_unmatched_issues_on_issue_id"

  create_table "watched_issues", force: :cascade do |t|
    t.integer  "comic_vine_series_id", null: false
    t.integer  "issue_id"
    t.integer  "number",               null: false
    t.string   "name"
    t.date     "cover_date"
    t.string   "status",               null: false
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "watched_issues", ["comic_vine_series_id"], name: "index_watched_issues_on_comic_vine_series_id"
  add_index "watched_issues", ["issue_id"], name: "index_watched_issues_on_issue_id"

end
