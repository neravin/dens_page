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

ActiveRecord::Schema.define(version: 20140715122847) do

  create_table "links", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "site"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "projects", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_url"
    t.string   "site"
  end

  create_table "projects_services", id: false, force: true do |t|
    t.integer "project_id", null: false
    t.integer "service_id", null: false
  end

  add_index "projects_services", ["project_id"], name: "index_projects_services_on_project_id"
  add_index "projects_services", ["service_id"], name: "index_projects_services_on_service_id"

  create_table "services", force: true do |t|
    t.string  "name"
    t.decimal "price",      precision: 8, scale: 2
    t.date    "start_date"
    t.date    "end_date"
  end

end
