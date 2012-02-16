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

ActiveRecord::Schema.define(:version => 20120216063742) do

  create_table "blank_sections", :force => true do |t|
    t.integer  "document_id"
    t.integer  "component_id"
    t.integer  "xpos"
    t.integer  "ypos"
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "components", :force => true do |t|
    t.string   "name"
    t.string   "component_icon_file_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "departments", :force => true do |t|
    t.string   "name"
    t.integer  "incharge_user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dockets", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dockets_document_sets", :force => true do |t|
    t.integer  "docket_id"
    t.integer  "document_set_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dockets_documents", :force => true do |t|
    t.integer  "docket_id"
    t.integer  "document_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "document_sets", :force => true do |t|
    t.string   "name"
    t.integer  "document_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "documents", :force => true do |t|
    t.string   "name"
    t.string   "blank_form_file_name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "document_set_id"
  end

  create_table "example_sets", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "examples", :force => true do |t|
    t.string   "name"
    t.string   "content_file_name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "component_id"
    t.boolean  "correct"
    t.integer  "example_set_id"
  end

  create_table "sets", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "teams", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "department_id"
  end

  create_table "teams_tests", :force => true do |t|
    t.integer  "test_id"
    t.integer  "team_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "teams_users", :force => true do |t|
    t.integer  "user_id"
    t.integer  "team_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "temps", :force => true do |t|
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "test_checklist_data", :force => true do |t|
    t.integer  "test_id"
    t.integer  "team_id"
    t.integer  "user_id"
    t.float    "score"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "test_doc_infos", :force => true do |t|
    t.integer  "test_doc_id"
    t.integer  "blank_section_id"
    t.integer  "example_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "test_docs", :force => true do |t|
    t.integer  "document_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "test_id"
  end

  create_table "test_results", :force => true do |t|
    t.integer  "test_doc_info_id"
    t.integer  "answer_key"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "team_id"
  end

  create_table "test_scores", :force => true do |t|
    t.integer  "user_id"
    t.integer  "test_id"
    t.integer  "team_id"
    t.integer  "score"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "test_teams", :force => true do |t|
    t.integer  "team_id"
    t.integer  "test_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "test_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tests", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "docket_id"
    t.integer  "test_type_id"
    t.integer  "source_id"
  end

  create_table "uploads", :force => true do |t|
    t.string   "xls_file_name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "department_id"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "department_id"
    t.boolean  "admin"
    t.boolean  "documentor"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
