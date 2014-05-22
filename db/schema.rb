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

ActiveRecord::Schema.define(version: 20140522182812) do

  create_table "leagues", force: true do |t|
    t.integer  "sport_id",          null: false
    t.integer  "league_manager_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name",              null: false
  end

  create_table "roster_adds", force: true do |t|
    t.integer  "team_id",    null: false
    t.integer  "player_id",  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sports", force: true do |t|
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sports", ["name"], name: "index_sports_on_name", unique: true

  create_table "team_adds", force: true do |t|
    t.integer  "league_id",  null: false
    t.integer  "team_id",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "teams", force: true do |t|
    t.string   "name",       null: false
    t.integer  "manager_id", null: false
    t.integer  "league_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "sport_id",   null: false
  end

  create_table "users", force: true do |t|
    t.string   "email",           null: false
    t.string   "first_name",      null: false
    t.string   "last_name",       null: false
    t.string   "password_digest", null: false
    t.string   "session_token",   null: false
    t.string   "gender"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

end
