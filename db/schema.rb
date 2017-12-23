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

ActiveRecord::Schema.define(version: 0) do

  create_table "categories", force: :cascade do |t|
    t.string   "name",        limit: 255,   null: false
    t.text     "description", limit: 65535
    t.string   "slug",        limit: 255,   null: false
    t.string   "ancestry",    limit: 255
    t.integer  "site_id",     limit: 4,     null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "items", force: :cascade do |t|
    t.integer  "post_id",           limit: 4
    t.integer  "item_content_id",   limit: 4
    t.string   "item_content_type", limit: 255
    t.integer  "order",             limit: 4,   null: false
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "items", ["post_id"], name: "fk_posts_items", using: :btree

  create_table "list_items", force: :cascade do |t|
    t.integer  "list_id",    limit: 4,   null: false
    t.string   "content",    limit: 255
    t.integer  "order",      limit: 4,   null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "list_items", ["list_id"], name: "index_list_items_on_list_id", using: :btree

  create_table "lists", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "posts", force: :cascade do |t|
    t.string   "title",       limit: 255, null: false
    t.integer  "site_id",     limit: 4,   null: false
    t.integer  "category_id", limit: 4,   null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "posts", ["category_id"], name: "fk_categories_posts", using: :btree
  add_index "posts", ["site_id"], name: "fk_sites_posts", using: :btree

  create_table "sites", force: :cascade do |t|
    t.string   "name",       limit: 255, null: false
    t.string   "url",        limit: 255, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "texts", force: :cascade do |t|
    t.text     "content",    limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_foreign_key "items", "posts", name: "fk_posts_items"
  add_foreign_key "list_items", "lists", name: "fk_lists_list_items"
  add_foreign_key "posts", "categories", name: "fk_categories_posts"
  add_foreign_key "posts", "sites", name: "fk_sites_posts"
end
