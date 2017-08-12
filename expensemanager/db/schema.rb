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

ActiveRecord::Schema.define(version: 20170812010850) do

  create_table "categories", force: :cascade do |t|
    t.string   "cname"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "expense_category_mappings", force: :cascade do |t|
    t.integer  "category_id"
    t.string   "categorized_type"
    t.integer  "categorized_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["categorized_type", "categorized_id"], name: "categorized_id"
    t.index ["category_id"], name: "index_expense_category_mappings_on_category_id"
  end

  create_table "expenses", force: :cascade do |t|
    t.integer  "amount"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_expenses_on_user_id"
  end

  create_table "icategories", force: :cascade do |t|
    t.string   "icname"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "income_category_mappings", force: :cascade do |t|
    t.integer  "icategory_id"
    t.string   "icategorized_type"
    t.integer  "icategorized_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["icategorized_type", "icategorized_id"], name: "icategorized_id"
    t.index ["icategory_id"], name: "index_income_category_mappings_on_icategory_id"
  end

  create_table "incomes", force: :cascade do |t|
    t.integer  "amount"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_incomes_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "password"
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
