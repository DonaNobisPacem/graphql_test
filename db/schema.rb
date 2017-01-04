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

ActiveRecord::Schema.define(version: 20170104045821) do

  create_table "heros", force: :cascade do |t|
    t.string   "name"
    t.string   "main_attr"
    t.string   "skill1"
    t.string   "skill2"
    t.string   "skill3"
    t.string   "skill4"
    t.integer  "str"
    t.integer  "agi"
    t.integer  "int"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "itemizations", force: :cascade do |t|
    t.integer  "hero_id"
    t.integer  "item_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hero_id"], name: "index_itemizations_on_hero_id"
    t.index ["item_id"], name: "index_itemizations_on_item_id"
  end

  create_table "items", force: :cascade do |t|
    t.string   "name"
    t.integer  "cost"
    t.integer  "hero_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hero_id"], name: "index_items_on_hero_id"
  end

end
