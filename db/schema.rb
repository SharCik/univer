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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20161018112010) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "admin_users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "assessments", force: :cascade do |t|
    t.string  "subject"
    t.integer "value"
    t.string  "data"
    t.integer "semester_id"
    t.integer "student_id"
  end

  create_table "assets", force: :cascade do |t|
    t.string   "storage_uid"
    t.string   "storage_name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "storage_width"
    t.integer  "storage_height"
    t.float    "storage_aspect_ratio"
    t.integer  "storage_depth"
    t.string   "storage_format"
    t.string   "storage_mime_type"
    t.string   "storage_size"
  end

  create_table "bids", force: :cascade do |t|
    t.string   "name"
    t.string   "phone"
    t.string   "mail"
    t.string   "comment"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "city_id"
    t.integer  "university_id"
    t.integer  "departament_id"
    t.integer  "specialty_id"
    t.integer  "magistracy_id"
  end

  add_index "bids", ["city_id"], name: "index_bids_on_city_id", using: :btree
  add_index "bids", ["departament_id"], name: "index_bids_on_departament_id", using: :btree
  add_index "bids", ["specialty_id"], name: "index_bids_on_specialty_id", using: :btree
  add_index "bids", ["university_id"], name: "index_bids_on_university_id", using: :btree

  create_table "cities", force: :cascade do |t|
    t.string   "name"
    t.string   "image_city"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "credits", force: :cascade do |t|
    t.string  "subject"
    t.boolean "value",       default: false
    t.string  "data"
    t.integer "semester_id"
  end

  create_table "departaments", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "university_id"
  end

  add_index "departaments", ["university_id"], name: "index_departaments_on_university_id", using: :btree

  create_table "diff_credits", force: :cascade do |t|
    t.string   "subject"
    t.integer  "value"
    t.string   "data"
    t.integer  "semester_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "magistracies", force: :cascade do |t|
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "name"
    t.string   "profession"
    t.integer  "training_period"
    t.boolean  "ochno"
    t.boolean  "zaochno"
    t.integer  "ochno_price"
    t.integer  "zaochno_price"
    t.integer  "departament_id"
    t.integer  "training_period_zaochno"
  end

  add_index "magistracies", ["departament_id"], name: "index_magistracies_on_departament_id", using: :btree

  create_table "months", force: :cascade do |t|
    t.string   "name"
    t.integer  "semester_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "news", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "news_image"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.text     "short_description"
  end

  create_table "omissions", force: :cascade do |t|
    t.integer  "hours"
    t.integer  "month_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "penalties", force: :cascade do |t|
    t.string   "title"
    t.string   "data"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "semester_id"
  end

  create_table "qualifications", force: :cascade do |t|
    t.string   "name"
    t.integer  "specialty_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "qualifications", ["specialty_id"], name: "index_qualifications_on_specialty_id", using: :btree

  create_table "semesters", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "number"
    t.integer  "student_id"
    t.string   "period"
  end

  add_index "semesters", ["student_id"], name: "index_semesters_on_student_id", using: :btree

  create_table "services", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "service_image"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "specialties", force: :cascade do |t|
    t.string   "name"
    t.integer  "departament_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "profession"
    t.integer  "training_period"
    t.boolean  "ochno"
    t.boolean  "zaochno"
    t.integer  "ochno_price"
    t.integer  "zaochno_price"
    t.integer  "training_period_zaochno"
  end

  add_index "specialties", ["departament_id"], name: "index_specialties_on_departament_id", using: :btree

  create_table "students", force: :cascade do |t|
    t.string   "username",            default: "",    null: false
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",       default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "specialty_id"
    t.string   "country"
    t.string   "full_name"
    t.string   "avatar"
    t.boolean  "hostel",              default: false
    t.string   "password_digest"
    t.string   "birthday"
    t.string   "rating"
  end

  add_index "students", ["specialty_id"], name: "index_students_on_specialty_id", using: :btree
  add_index "students", ["username"], name: "index_students_on_username", unique: true, using: :btree

  create_table "universities", force: :cascade do |t|
    t.string   "name"
    t.string   "short_name"
    t.text     "description"
    t.string   "image"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "city_id"
    t.string   "address"
    t.boolean  "preparatory_department"
    t.boolean  "hostel"
    t.integer  "rating"
    t.boolean  "magistracy"
    t.integer  "initial_cost"
    t.boolean  "ochno"
    t.boolean  "zaochno"
  end

  add_index "universities", ["city_id"], name: "index_universities_on_city_id", using: :btree

  add_foreign_key "bids", "cities"
  add_foreign_key "bids", "departaments"
  add_foreign_key "bids", "specialties"
  add_foreign_key "bids", "universities"
  add_foreign_key "departaments", "universities"
  add_foreign_key "magistracies", "departaments"
  add_foreign_key "qualifications", "specialties"
  add_foreign_key "semesters", "students"
  add_foreign_key "specialties", "departaments"
  add_foreign_key "students", "specialties"
  add_foreign_key "universities", "cities"
end
