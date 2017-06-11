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

ActiveRecord::Schema.define(version: 20170611223156) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "availabilities", force: :cascade do |t|
    t.integer  "user_id"
    t.date     "day_off",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_availabilities_on_user_id", using: :btree
  end

  create_table "jobs", force: :cascade do |t|
    t.string   "name",       null: false
    t.date     "start_date", null: false
    t.date     "end_date",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_jobs_on_name", using: :btree
  end

  create_table "profiles", force: :cascade do |t|
    t.integer  "user_id",      null: false
    t.string   "phone_number", null: false
    t.date     "accepted_at"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["user_id"], name: "index_profiles_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name", null: false
    t.string   "last_name",  null: false
    t.string   "email",      null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", using: :btree
  end

end
