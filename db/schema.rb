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

ActiveRecord::Schema.define(version: 20170326025642) do

  create_table "labels", force: :cascade do |t|
    t.string   "from_name"
    t.string   "from_street1"
    t.string   "from_street2"
    t.string   "from_city"
    t.string   "from_state"
    t.string   "from_zip"
    t.string   "to_name"
    t.string   "to_street1"
    t.string   "to_street2"
    t.string   "to_city"
    t.string   "to_state"
    t.string   "to_zip"
    t.float    "width"
    t.float    "length"
    t.float    "height"
    t.float    "weight"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

end
