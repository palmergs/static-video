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

ActiveRecord::Schema.define(version: 2020_06_27_151329) do

  create_table "assets", force: :cascade do |t|
    t.integer "site_id", null: false
    t.string "type", null: false
    t.string "alt", default: "", null: false
    t.string "filename", null: false
    t.integer "rel_order", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["site_id"], name: "index_assets_on_site_id"
  end

  create_table "sites", force: :cascade do |t|
    t.string "title", null: false
    t.string "subtitle", default: "", null: false
    t.string "descr", default: "", null: false
    t.string "background", null: false
    t.integer "assets_count", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "assets", "sites"
end
