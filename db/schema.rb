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

ActiveRecord::Schema.define(:version => 20101125212456) do

  create_table "buddies", :force => true do |t|
    t.integer  "request_id",  :null => false
    t.integer  "approval_id", :null => false
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "checklists", :force => true do |t|
    t.string   "name",                              :null => false
    t.boolean  "active",          :default => true
    t.integer  "owner_id",                          :null => false
    t.date     "expiration_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "collaborations", :force => true do |t|
    t.integer  "user_id"
    t.integer  "checklist_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "items", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "checklist_id",                      :null => false
    t.integer  "completed_by_id"
    t.integer  "assigned_to_id"
    t.string   "name"
    t.text     "description"
    t.boolean  "active",          :default => true
    t.datetime "completed_date"
  end

  create_table "tasks", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "checklist_id",                          :null => false
    t.integer  "assigned_to_id"
    t.integer  "completed_by_id"
    t.string   "name"
    t.decimal  "percentage_complete"
    t.boolean  "active",              :default => true
    t.text     "description"
  end

  create_table "users", :force => true do |t|
    t.string   "first_name",                         :null => false
    t.string   "last_name",                          :null => false
    t.string   "login",                              :null => false
    t.string   "email",                              :null => false
    t.string   "crypted_password",                   :null => false
    t.string   "password_salt",                      :null => false
    t.string   "persistence_token",                  :null => false
    t.string   "single_access_token",                :null => false
    t.string   "perishable_token",                   :null => false
    t.integer  "login_count",         :default => 0, :null => false
    t.integer  "failed_login_count",  :default => 0, :null => false
    t.datetime "last_request_at"
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.string   "current_login_ip"
    t.string   "last_login_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
