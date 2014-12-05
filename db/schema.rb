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

ActiveRecord::Schema.define(version: 20141205183003) do

  create_table "card_mana_costs", id: false, force: true do |t|
    t.integer "card_id",  null: false
    t.integer "color_id"
    t.integer "amount"
  end

  add_index "card_mana_costs", ["card_id", "color_id"], name: "index_card_mana_costs_on_card_id_and_color_id", unique: true
  add_index "card_mana_costs", ["color_id"], name: "index_card_mana_costs_on_color_id"

  create_table "card_sub_types", force: true do |t|
    t.string "name", null: false
  end

  add_index "card_sub_types", ["name"], name: "index_card_sub_types_on_name", unique: true

  create_table "card_sub_types_cards", id: false, force: true do |t|
    t.integer "card_id",          null: false
    t.integer "card_sub_type_id", null: false
  end

  add_index "card_sub_types_cards", ["card_id", "card_sub_type_id"], name: "index_card_sub_types_cards_on_card_id_and_card_sub_type_id", unique: true
  add_index "card_sub_types_cards", ["card_sub_type_id"], name: "index_card_sub_types_cards_on_card_sub_type_id"

  create_table "card_super_types", force: true do |t|
    t.string "name", null: false
  end

  add_index "card_super_types", ["name"], name: "index_card_super_types_on_name", unique: true

  create_table "card_super_types_cards", id: false, force: true do |t|
    t.integer "card_id",            null: false
    t.integer "card_super_type_id", null: false
  end

  add_index "card_super_types_cards", ["card_id", "card_super_type_id"], name: "index_card_super_types_cards_on_card_id_and_card_super_type_id", unique: true
  add_index "card_super_types_cards", ["card_super_type_id"], name: "index_card_super_types_cards_on_card_super_type_id"

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
    t.string   "name",       null: false
    t.string   "text"
    t.string   "flavor"
    t.string   "rarity"
    t.integer  "power"
    t.integer  "toughness"
    t.string   "number",     null: false
    t.string   "image"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cards", ["name"], name: "index_cards_on_name"
  add_index "cards", ["number"], name: "index_cards_on_number", unique: true
  add_index "cards", ["power"], name: "index_cards_on_power"
  add_index "cards", ["rarity"], name: "index_cards_on_rarity"
  add_index "cards", ["toughness"], name: "index_cards_on_toughness"

  create_table "colors", force: true do |t|
    t.string "name", null: false
    t.string "land"
  end

  add_index "colors", ["name"], name: "index_colors_on_name", unique: true

  create_table "deck_cards", id: false, force: true do |t|
    t.integer "card_id", null: false
    t.integer "deck_id", null: false
    t.integer "amount",  null: false
  end

  add_index "deck_cards", ["card_id", "deck_id"], name: "index_deck_cards_on_card_id_and_deck_id", unique: true
  add_index "deck_cards", ["deck_id"], name: "index_deck_cards_on_deck_id"

  create_table "decks", force: true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "decks", ["user_id"], name: "index_decks_on_user_id"

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
