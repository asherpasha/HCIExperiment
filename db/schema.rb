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

ActiveRecord::Schema.define(version: 20150316225718) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "experiments", force: :cascade do |t|
    t.integer  "subject_id"
    t.integer  "group"
    t.datetime "start_time"
    t.datetime "end_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "results", force: :cascade do |t|
    t.integer  "subject_id"
    t.integer  "stimuli_number"
    t.datetime "start_time"
    t.datetime "end_time"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "answer"
    t.integer  "subject_answer"
  end

  create_table "subjects", force: :cascade do |t|
    t.string   "name"
    t.string   "age"
    t.string   "integer"
    t.string   "username"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.integer  "experiment_group"
    t.string   "email"
    t.integer  "interaction_rating"
    t.integer  "display_helpfulness"
    t.integer  "efp_experience"
    t.text     "rsvp_experience"
    t.text     "experience_difficulty"
    t.string   "gender"
    t.string   "color_test"
    t.string   "input_type"
  end

  create_table "tests", force: :cascade do |t|
    t.integer  "subject_id"
    t.integer  "stimuli_number"
    t.datetime "start_time"
    t.datetime "end_time"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

end
