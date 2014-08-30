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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20140830205244) do

  create_table "accounts", :force => true do |t|
    t.integer  "balance",    :limit => 255
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
    t.string   "user_id"
  end

  create_table "assignments", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "user_id"
    t.integer  "role_id"
  end

  create_table "comments", :force => true do |t|
    t.text     "body"
    t.integer  "match_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "comments", ["match_id"], :name => "index_comments_on_match_id"

  create_table "matches", :force => true do |t|
    t.string   "home_team"
    t.string   "away_team"
    t.integer  "home_team_odds"
    t.integer  "away_team_odds"
    t.integer  "home_team_wager"
    t.integer  "away_team_wager"
    t.string   "date"
    t.string   "result"
    t.integer  "player1_id"
    t.integer  "player2_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "roles", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "name"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.string   "password_digest"
    t.string   "bio"
    t.integer  "roles_mask"
    t.string   "persistence_token"
  end

end
