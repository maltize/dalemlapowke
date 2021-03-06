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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130114214442) do

  create_table "bribes", :force => true do |t|
    t.integer  "kind",                                       :null => false
    t.integer  "area",                                       :null => false
    t.integer  "service",                                    :null => false
    t.string   "year",                                       :null => false
    t.string   "month",                                      :null => false
    t.decimal  "amount",       :precision => 9, :scale => 2, :null => false
    t.string   "subject",                                    :null => false
    t.text     "description"
    t.string   "user"
    t.datetime "validated_at"
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
  end

  add_index "bribes", ["area"], :name => "index_bribes_on_area"
  add_index "bribes", ["kind"], :name => "index_bribes_on_kind"
  add_index "bribes", ["service"], :name => "index_bribes_on_service"
  add_index "bribes", ["subject"], :name => "index_bribes_on_subject"
  add_index "bribes", ["validated_at"], :name => "index_bribes_on_validated_at"

  create_table "comments", :force => true do |t|
    t.integer  "bribe_id",     :null => false
    t.text     "comment",      :null => false
    t.string   "user"
    t.datetime "validated_at"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "comments", ["bribe_id"], :name => "index_comments_on_bribe_id"
  add_index "comments", ["validated_at"], :name => "index_comments_on_validated_at"

end
