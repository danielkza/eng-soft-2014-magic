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

ActiveRecord::Schema.define(version: 20141204170401) do

  create_table "card_mana_costs", force: true do |t|
    t.integer "card_id",  null: false
    t.integer "color_id"
    t.integer "amount",   null: false
  end

  add_index "card_mana_costs", ["card_id", "color_id"], name: "index_card_mana_costs_on_card_id_and_color_id", unique: true
  add_index "card_mana_costs", ["color_id"], name: "index_card_mana_costs_on_color_id"

  create_table "card_types", force: true do |t|
    t.string "name", null: false
  end

  add_index "card_types", ["name"], name: "index_card_types_on_name", unique: true

  create_table "card_types_cards", id: false, force: true do |t|
    t.integer "card_id",      null: false
    t.integer "card_type_id", null: false
  end

  add_index "card_types_cards", ["card_id", "card_type_id"], name: "index_card_types_cards_on_card_id_and_card_type_id", unique: true
  add_index "card_types_cards", ["card_type_id"], name: "index_card_types_cards_on_card_type_id"

  create_table "cards", force: true do |t|
    t.string   "name",        null: false
    t.string   "description", null: false
    t.integer  "power"
    t.integer  "toughness"
    t.string   "number",      null: false
    t.string   "image"
    t.integer  "color_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cards", ["name"], name: "index_cards_on_name"
  add_index "cards", ["number"], name: "index_cards_on_number", unique: true
  add_index "cards", ["power"], name: "index_cards_on_power"
  add_index "cards", ["toughness"], name: "index_cards_on_toughness"

  create_table "colors", force: true do |t|
    t.string "name", null: false
    t.string "land"
  end

  add_index "colors", ["name"], name: "index_colors_on_name", unique: true

end
