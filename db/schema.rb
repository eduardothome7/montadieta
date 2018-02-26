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

ActiveRecord::Schema.define(version: 20180223171853) do

  create_table "category_foods", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "icon"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "diets", force: :cascade do |t|
    t.string "objective"
    t.integer "tmb"
    t.integer "kcal"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

# Could not dump table "foods" because of following StandardError
#   Unknown type '' for column 'protein'

  create_table "meal_foods", force: :cascade do |t|
    t.integer "meal_id"
    t.integer "food_id"
    t.decimal "weight"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "meals", force: :cascade do |t|
    t.integer "diet_id"
    t.string "name"
    t.datetime "time_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
