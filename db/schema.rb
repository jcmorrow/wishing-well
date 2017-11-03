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

ActiveRecord::Schema.define(version: 20160606234822) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree

  create_table "game_strategies", force: :cascade do |t|
    t.integer "game_id"
    t.integer "strategy_id"
  end

  add_index "game_strategies", ["game_id"], name: "index_game_strategies_on_game_id", using: :btree

  create_table "games", force: :cascade do |t|
    t.integer  "match_id"
    t.datetime "finished_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "winner_id"
  end

  add_index "games", ["match_id"], name: "index_games_on_match_id", using: :btree

  create_table "matches", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.integer  "game_count"
  end

  create_table "matches_strategies", force: :cascade do |t|
    t.integer "match_id"
    t.integer "strategy_id"
  end

  add_index "matches_strategies", ["match_id"], name: "index_matches_strategies_on_match_id", using: :btree
  add_index "matches_strategies", ["strategy_id"], name: "index_matches_strategies_on_strategy_id", using: :btree

  create_table "priorities", force: :cascade do |t|
    t.string   "card_type"
    t.integer  "strategy_id"
    t.integer  "sequence"
    t.boolean  "permanent?"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "strategies", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "turns", force: :cascade do |t|
    t.integer "game_strategy_id"
    t.integer "points_gained"
    t.integer "money_gained"
    t.integer "number",           default: 0
  end

  add_index "turns", ["game_strategy_id"], name: "index_turns_on_game_strategy_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "email",                          null: false
    t.string   "encrypted_password", limit: 128, null: false
    t.string   "confirmation_token", limit: 128
    t.string   "remember_token",     limit: 128, null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", using: :btree
  add_index "users", ["remember_token"], name: "index_users_on_remember_token", using: :btree

  add_foreign_key "game_strategies", "games"
  add_foreign_key "game_strategies", "strategies"
  add_foreign_key "games", "game_strategies", column: "winner_id"
  add_foreign_key "games", "matches"
  add_foreign_key "matches_strategies", "matches"
  add_foreign_key "matches_strategies", "strategies"
  add_foreign_key "turns", "game_strategies"
end
