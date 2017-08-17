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

ActiveRecord::Schema.define(version: 20170728173136) do

  create_table "athletes", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.integer "grade"
    t.string "image"
    t.integer "attendance"
    t.string "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "meets", force: :cascade do |t|
    t.string "title", null: false
    t.string "location"
    t.datetime "date"
    t.string "terrain"
    t.string "description"
    t.string "image"
    t.string "icon"
    t.string "weather"
    t.string "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "notices", force: :cascade do |t|
    t.string "title", null: false
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "positions", force: :cascade do |t|
    t.string "placement"
    t.string "time"
    t.boolean "pr"
    t.string "icon"
    t.string "note"
    t.boolean "medaled"
    t.integer "meet_id"
    t.integer "athlete_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["athlete_id"], name: "index_positions_on_athlete_id"
    t.index ["meet_id"], name: "index_positions_on_meet_id"
  end

  create_table "scores", force: :cascade do |t|
    t.string "level"
    t.string "reps"
    t.string "rounds"
    t.string "time"
    t.boolean "pr"
    t.string "placement"
    t.string "icon"
    t.integer "wod_id"
    t.integer "athlete_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["athlete_id"], name: "index_scores_on_athlete_id"
    t.index ["wod_id"], name: "index_scores_on_wod_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "password_digest"
    t.string "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "wods", force: :cascade do |t|
    t.string "title", null: false
    t.string "location"
    t.datetime "date"
    t.string "description"
    t.string "image"
    t.string "icon"
    t.string "note"
    t.boolean "hero"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
