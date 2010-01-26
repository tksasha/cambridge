# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20091016074907) do

  create_table "answers", :force => true do |t|
    t.integer  "sentence_id"
    t.string   "text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "exercises", :force => true do |t|
    t.integer  "unit_id"
    t.integer  "number"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "description"
  end

  create_table "sentences", :force => true do |t|
    t.integer  "exercise_id"
    t.string   "text"
    t.integer  "number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sentences", ["exercise_id", "number"], :name => "index_sentences_on_exercise_id_and_number", :unique => true

  create_table "units", :force => true do |t|
    t.integer  "number"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  add_index "units", ["number"], :name => "index_units_on_number", :unique => true

end
