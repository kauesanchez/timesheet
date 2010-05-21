# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 16) do

  create_table "age_groups", :force => true do |t|
    t.integer  "min_age"
    t.integer  "max_age"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "care_days", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "care_needs", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "colgate_rates", :force => true do |t|
    t.integer  "colgate_survey_id"
    t.integer  "toothpaste_word_id"
    t.integer  "rate"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "colgate_surveys", :force => true do |t|
    t.integer  "age_group_id"
    t.string   "gender"
    t.integer  "state_id"
    t.integer  "income_group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "colgate_words", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "income_groups", :force => true do |t|
    t.integer  "value"
    t.string   "label"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "occasion_words", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "oral_care_words", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "samplings", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "states", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "surveys", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "toothpaste_word_whies", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "toothpaste_words", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "login"
    t.string   "hashed_password"
    t.string   "email"
    t.string   "salt"
    t.string   "role"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
