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

ActiveRecord::Schema.define(version: 2018_10_11_111439) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "days", force: :cascade do |t|
    t.date "date"
    t.time "start_time"
    t.time "end_time"
    t.bigint "kid_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["kid_id"], name: "index_days_on_kid_id"
  end

  create_table "foods", force: :cascade do |t|
    t.string "breakfast_items"
    t.string "breakfast_had"
    t.string "am_snack_items"
    t.string "am_snack_had"
    t.string "lunch_items"
    t.string "lunch_had"
    t.string "pm_snack_items"
    t.string "pm_snack_had"
    t.string "dinner_tea_items"
    t.string "dinner_tea_had"
    t.bigint "day_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["day_id"], name: "index_foods_on_day_id"
  end

  create_table "kids", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.date "date_of_birth"
    t.string "gender"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "nappy_potties", force: :cascade do |t|
    t.integer "wet"
    t.integer "bm_normal"
    t.integer "bm_runny"
    t.integer "bm_hard"
    t.bigint "day_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["day_id"], name: "index_nappy_potties_on_day_id"
  end

  create_table "naps", force: :cascade do |t|
    t.time "start"
    t.time "end"
    t.bigint "day_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["day_id"], name: "index_naps_on_day_id"
  end

  create_table "notes", force: :cascade do |t|
    t.string "daily_note"
    t.bigint "day_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["day_id"], name: "index_notes_on_day_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.string "allergies"
    t.string "medications"
    t.bigint "kid_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["kid_id"], name: "index_profiles_on_kid_id"
  end

  create_table "schedules", force: :cascade do |t|
    t.time "monday"
    t.time "tuesday"
    t.time "wednesday"
    t.time "thursday"
    t.time "friday"
    t.bigint "kid_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["kid_id"], name: "index_schedules_on_kid_id"
  end

  create_table "user_kids", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "kid_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["kid_id"], name: "index_user_kids_on_kid_id"
    t.index ["user_id"], name: "index_user_kids_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "password_digest"
    t.boolean "childminder"
    t.string "email"
    t.string "phone_number"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
