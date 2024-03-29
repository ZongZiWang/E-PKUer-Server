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

ActiveRecord::Schema.define(:version => 20121229181202) do

  create_table "complaints", :force => true do |t|
    t.integer  "user_id"
    t.integer  "restaurant_id"
    t.string   "content"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "dish_comments", :force => true do |t|
    t.integer  "dish_id"
    t.integer  "user_id"
    t.float    "evaluation"
    t.string   "content"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "dishes", :force => true do |t|
    t.string   "name"
    t.string   "image_url",            :default => "404.png"
    t.float    "evaluation",           :default => 5.0
    t.float    "cost",                 :default => 5.0
    t.string   "category",             :default => "Normal"
    t.string   "description",          :default => "Recommended"
    t.datetime "created_at",                                      :null => false
    t.datetime "updated_at",                                      :null => false
    t.integer  "restaurant_id"
    t.integer  "recommendation_count", :default => 0
  end

  create_table "restaurant_comments", :force => true do |t|
    t.integer  "restaurant_id"
    t.integer  "user_id"
    t.float    "evaluation"
    t.float    "cost"
    t.string   "content"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
    t.string   "recommendation_dishes"
  end

  create_table "restaurants", :force => true do |t|
    t.string   "name"
    t.string   "image_url"
    t.float    "evaluation"
    t.string   "location_name"
    t.string   "location_zone"
    t.float    "location_latitude"
    t.float    "location_longitude"
    t.string   "info_time"
    t.string   "info_tel"
    t.string   "info_summary"
    t.float    "average_cost"
    t.string   "category"
    t.string   "description"
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
    t.integer  "status_busy",        :default => 0
    t.integer  "status_normal",      :default => 0
    t.integer  "status_loose",       :default => 0
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "hashed_password"
    t.string   "salt"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

end
