# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_06_17_170711) do
  create_table "exercise_sets", force: :cascade do |t|
    t.integer "exercise_id", null: false
    t.integer "workout_id", null: false
    t.integer "reps"
    t.float "weight"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["exercise_id"], name: "index_exercise_sets_on_exercise_id"
    t.index ["workout_id"], name: "index_exercise_sets_on_workout_id"
  end

  create_table "exercises", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_workouts", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "workout_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_user_workouts_on_user_id"
    t.index ["workout_id"], name: "index_user_workouts_on_workout_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "workouts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "exercise_sets", "exercises"
  add_foreign_key "exercise_sets", "workouts"
  add_foreign_key "user_workouts", "users"
  add_foreign_key "user_workouts", "workouts"
end
