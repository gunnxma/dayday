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

ActiveRecord::Schema.define(version: 20150312061319) do

  create_table "activities", force: true do |t|
    t.integer  "trackable_id"
    t.string   "trackable_type"
    t.integer  "owner_id"
    t.string   "owner_type"
    t.string   "key"
    t.text     "parameters"
    t.integer  "recipient_id"
    t.string   "recipient_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "activities", ["owner_id", "owner_type"], name: "index_activities_on_owner_id_and_owner_type"
  add_index "activities", ["recipient_id", "recipient_type"], name: "index_activities_on_recipient_id_and_recipient_type"
  add_index "activities", ["trackable_id", "trackable_type"], name: "index_activities_on_trackable_id_and_trackable_type"

  create_table "categories", force: true do |t|
    t.string   "name"
    t.integer  "parent_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "categories", ["parent_id"], name: "index_categories_on_parent_id"

  create_table "category_tags", force: true do |t|
    t.integer  "category_id"
    t.integer  "tag_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "category_tags", ["category_id"], name: "index_category_tags_on_category_id"
  add_index "category_tags", ["tag_id"], name: "index_category_tags_on_tag_id"

  create_table "comments", force: true do |t|
    t.string   "body"
    t.integer  "user_id"
    t.integer  "votes_count",      default: 0
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["commentable_id", "commentable_type"], name: "index_comments_on_commentable_id_and_commentable_type"

  create_table "fanciers", force: true do |t|
    t.integer  "thing_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "fanciers", ["thing_id"], name: "index_fanciers_on_thing_id"
  add_index "fanciers", ["user_id"], name: "index_fanciers_on_user_id"

  create_table "feeling_ups", force: true do |t|
    t.integer  "feeling_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "feeling_ups", ["feeling_id"], name: "index_feeling_ups_on_feeling_id"
  add_index "feeling_ups", ["user_id"], name: "index_feeling_ups_on_user_id"

  create_table "feelings", force: true do |t|
    t.integer  "feelingable_id"
    t.integer  "user_id"
    t.string   "body"
    t.integer  "votes_count",      default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "feelingable_type"
  end

  add_index "feelings", ["feelingable_id"], name: "index_feelings_on_feelingable_id"
  add_index "feelings", ["user_id"], name: "index_feelings_on_user_id"

  create_table "identities", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lfanciers", force: true do |t|
    t.integer  "list_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lfeelings", force: true do |t|
    t.integer  "list_id"
    t.integer  "user_id"
    t.string   "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "likes", force: true do |t|
    t.integer  "user_id"
    t.string   "likeable_type"
    t.integer  "likeable_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "list_things", force: true do |t|
    t.integer  "list_id"
    t.integer  "thing_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lists", force: true do |t|
    t.string   "title"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "notifications", force: true do |t|
    t.integer  "user_id"
    t.string   "action"
    t.boolean  "read",                  default: false
    t.integer  "notificationable_id"
    t.string   "notificationable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "owners", force: true do |t|
    t.integer  "thing_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "owners", ["thing_id"], name: "index_owners_on_thing_id"
  add_index "owners", ["user_id"], name: "index_owners_on_user_id"

  create_table "owns", force: true do |t|
    t.integer  "user_id"
    t.integer  "thing_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "photos", force: true do |t|
    t.integer  "thing_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar"
    t.string   "token"
  end

  add_index "photos", ["thing_id"], name: "index_photos_on_thing_id"

  create_table "review_ups", force: true do |t|
    t.integer  "review_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "review_ups", ["review_id"], name: "index_review_ups_on_review_id"
  add_index "review_ups", ["user_id"], name: "index_review_ups_on_user_id"

  create_table "reviews", force: true do |t|
    t.integer  "thing_id"
    t.string   "title"
    t.string   "body"
    t.integer  "up"
    t.boolean  "publish"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "hits"
  end

  add_index "reviews", ["thing_id"], name: "index_reviews_on_thing_id"
  add_index "reviews", ["user_id"], name: "index_reviews_on_user_id"

  create_table "rfeelings", force: true do |t|
    t.integer  "review_id"
    t.integer  "user_id"
    t.string   "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rfeelings", ["review_id"], name: "index_rfeelings_on_review_id"
  add_index "rfeelings", ["user_id"], name: "index_rfeelings_on_user_id"

  create_table "tags", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "thing_tags", force: true do |t|
    t.integer  "thing_id"
    t.integer  "tag_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "things", force: true do |t|
    t.string   "title"
    t.string   "subtitle"
    t.string   "official_site"
    t.text     "body"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "token"
    t.boolean  "publish"
    t.integer  "fancier_count"
    t.integer  "owner_count"
    t.string   "price"
    t.string   "buy_url"
    t.integer  "hits"
  end

  add_index "things", ["user_id"], name: "index_things_on_user_id"

  create_table "user_followers", force: true do |t|
    t.integer  "user_id"
    t.integer  "follower_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar"
    t.string   "gender"
    t.string   "location"
    t.string   "site"
    t.string   "description"
  end

  create_table "votes", force: true do |t|
    t.integer  "user_id"
    t.string   "voteable_type"
    t.integer  "voteable_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
