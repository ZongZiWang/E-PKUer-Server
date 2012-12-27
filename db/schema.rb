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

ActiveRecord::Schema.define(:version => 20121227073559) do

  create_table "dish_comments", :force => true do |t|
    t.integer  "dish_id"
    t.integer  "user_id"
    t.float    "evaluation"
    t.string   "time"
    t.string   "content"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "dishes", :force => true do |t|
    t.string   "name"
    t.string   "category"
    t.float    "cost"
    t.string   "description"
    t.float    "evaluation"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "image_url"
    t.integer  "restaurant_id"
  end

  create_table "restaurant_comments", :force => true do |t|
    t.integer  "restaurant_id"
    t.integer  "user_id"
    t.float    "evaluation"
    t.float    "cost"
    t.string   "time"
    t.string   "content"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "restaurants", :force => true do |t|
    t.string   "name"
    t.string   "location_name"
    t.string   "location_zone"
    t.float    "location_latitude"
    t.float    "location_longitude"
    t.string   "category"
    t.float    "average_cost"
    t.string   "description"
    t.string   "recommendations"
    t.string   "info_time"
    t.string   "info_tel"
    t.string   "info_summary"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "busy"
    t.string   "image_url"
    t.string   "evaluation"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "hashed_password"
    t.string   "salt"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

end
