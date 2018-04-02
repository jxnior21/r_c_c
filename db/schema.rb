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

ActiveRecord::Schema.define(version: 20180121165427) do

  create_table "admin_users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "username", null: false
    t.string "password_digest", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "customers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "telephone", null: false
    t.string "email"
    t.string "address1", null: false
    t.string "city", null: false
    t.string "state", null: false
    t.string "zip", null: false
    t.string "church"
    t.string "gender"
    t.string "first_name2", null: false
    t.string "last_name2", null: false
    t.string "relationship", null: false
    t.string "telephone2", null: false
    t.bigint "event_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_customers_on_event_id"
  end

  create_table "events", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "title", default: "Evento", null: false
    t.string "date", limit: 8, default: "00/00/00"
    t.text "description", null: false
    t.string "price", default: "00.00", null: false
    t.integer "capacity", default: 0, null: false
    t.boolean "visible", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "future_events", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "title", default: "Evento", null: false
    t.string "date", limit: 8, default: "00/00/00"
    t.string "kind", default: "TBD", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
