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

ActiveRecord::Schema[7.1].define(version: 2024_05_13_201535) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "location_cities", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "location_state_id", null: false
    t.uuid "location_district_id"
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["location_district_id"], name: "index_location_cities_on_location_district_id"
    t.index ["location_state_id"], name: "index_location_cities_on_location_state_id"
  end

  create_table "location_countries", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", null: false, comment: "Country name"
    t.string "code", null: false, comment: "ISO 3166-1 alpha-2 code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "location_districts", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "location_state_id", null: false, comment: "State"
    t.string "name", null: false, comment: "District name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["location_state_id"], name: "index_location_districts_on_location_state_id"
  end

  create_table "location_postal_codes", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "location_city_id", null: false
    t.string "postal_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["location_city_id"], name: "index_location_postal_codes_on_location_city_id"
  end

  create_table "location_states", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "location_country_id", null: false, comment: "Country"
    t.string "name", null: false, comment: "State name"
    t.string "abbreviation", null: false, comment: "Local abbreviation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["location_country_id"], name: "index_location_states_on_location_country_id"
  end

  add_foreign_key "location_cities", "location_districts"
  add_foreign_key "location_cities", "location_states"
  add_foreign_key "location_districts", "location_states"
  add_foreign_key "location_postal_codes", "location_cities"
  add_foreign_key "location_states", "location_countries"
end
