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

ActiveRecord::Schema.define(version: 20150122040026) do

  create_table "episodes", force: :cascade do |t|
    t.text     "name"
    t.integer  "show_id"
    t.text     "status"
    t.text     "dir"
    t.text     "grp"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "episodes", ["show_id", "created_at"], name: "index_episodes_on_show_id_and_created_at"
  add_index "episodes", ["show_id"], name: "index_episodes_on_show_id"

  create_table "shows", force: :cascade do |t|
    t.text     "name"
    t.text     "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "poster"
    t.string   "dir"
  end

end
