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

ActiveRecord::Schema.define(version: 20140706181455) do

  create_table "blogs", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.text     "content"
    t.string   "bloggable_type"
    t.integer  "bloggable_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
  end

  create_table "contacts", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "donations", force: true do |t|
    t.integer  "amount"
    t.text     "comment"
    t.string   "donorname"
    t.string   "companyname"
    t.boolean  "recurring"
    t.integer  "project_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "donations_projects", force: true do |t|
    t.integer "donation_id"
    t.integer "project_id"
  end

  create_table "events", force: true do |t|
    t.string   "category"
    t.string   "infolink"
    t.string   "title"
    t.text     "description"
    t.datetime "date"
    t.string   "location"
    t.integer  "bloggable_id"
    t.string   "bloggable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "slug"
  end

  create_table "events_users", id: false, force: true do |t|
    t.integer "event_id"
    t.integer "user_id"
  end

  create_table "photos", force: true do |t|
    t.integer  "album_id"
    t.string   "image"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "projects", force: true do |t|
    t.string   "title",              null: false
    t.integer  "team_id",            null: false
    t.string   "status",             null: false
    t.string   "about",              null: false
    t.string   "description",        null: false
    t.integer  "bloggable_id"
    t.string   "bloggable_type"
    t.integer  "fundingraised"
    t.integer  "fundinggoal"
    t.date     "fundingstartdate"
    t.date     "fundingenddate"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "slug"
  end

  create_table "projects_users", id: false, force: true do |t|
    t.integer "user_id"
    t.integer "project_id"
  end

  create_table "teams", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "project_id"
    t.integer  "user_id"
    t.integer  "application_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "teams_users", force: true do |t|
    t.integer "team_id"
    t.integer "user_id"
  end

  create_table "users", force: true do |t|
    t.string   "email",              null: false
    t.string   "username",           null: false
    t.string   "crypted_password",   null: false
    t.string   "salt",               null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "bio"
    t.string   "dob"
    t.string   "firstname"
    t.string   "lastname"
    t.string   "major"
    t.string   "minor"
    t.string   "subscription"
    t.string   "cvlink"
    t.string   "resumelink"
    t.string   "mysitelink"
    t.string   "graduation"
    t.integer  "bloggable_id"
    t.string   "bloggable_type"
    t.string   "role"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "slug"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

end
