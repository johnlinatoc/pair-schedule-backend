# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_08_24_041046) do

  create_table "schedules", force: :cascade do |t|
    t.integer "weeks"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "sprints", force: :cascade do |t|
    t.integer "schedule_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["schedule_id"], name: "index_sprints_on_schedule_id"
  end

  create_table "user_sprints", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "sprint_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["sprint_id"], name: "index_user_sprints_on_sprint_id"
    t.index ["user_id"], name: "index_user_sprints_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.integer "schedule_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["schedule_id"], name: "index_users_on_schedule_id"
  end

  add_foreign_key "sprints", "schedules"
  add_foreign_key "user_sprints", "sprints"
  add_foreign_key "user_sprints", "users"
  add_foreign_key "users", "schedules"
end
