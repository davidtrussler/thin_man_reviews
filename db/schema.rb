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

ActiveRecord::Schema[7.0].define(version: 2024_08_09_170817) do
  create_table "reviews", force: :cascade do |t|
    t.string "title"
    t.string "medium"
    t.string "author"
    t.string "publisher"
    t.string "director"
    t.string "actors"
    t.string "country"
    t.string "venue"
    t.string "writer"
    t.string "artist"
    t.string "label"
    t.string "text"
    t.integer "running_time"
    t.datetime "date_publication"
    t.datetime "date_release"
    t.datetime "date_opening"
    t.datetime "date_closing"
    t.datetime "date_event"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "caption"
  end

end
