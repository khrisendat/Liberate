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

ActiveRecord::Schema.define(:version => 20130514043701) do

  create_table "books", :force => true do |t|
    t.string   "name"
    t.string   "author"
    t.string   "image_url"
    t.string   "description"
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
    t.string   "isbn"
    t.boolean  "is_checked_out", :default => false
  end

  add_index "books", ["isbn"], :name => "index_books_on_isbn"

  create_table "checkedouts", :force => true do |t|
    t.integer  "book_id"
    t.integer  "user_id"
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
    t.boolean  "active",     :default => true
  end

  create_table "checkouts", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "user"
  end

  create_table "comments", :force => true do |t|
    t.string   "comment"
    t.integer  "book_id"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "rating"
  end

  add_index "comments", ["book_id"], :name => "index_comments_on_book_id"
  add_index "comments", ["user_id"], :name => "index_comments_on_user_id"

  create_table "reserves", :force => true do |t|
    t.integer  "book_id"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",            :default => false
    t.float    "balance",          :default => 0.0
    t.integer  "checkedout_count", :default => 3
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

end
