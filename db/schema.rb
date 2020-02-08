# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_02_07_181009) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "comment_likes", force: :cascade do |t|
    t.bigint "comment_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["comment_id"], name: "index_comment_likes_on_comment_id"
    t.index ["user_id"], name: "index_comment_likes_on_user_id"
  end

  create_table "comments", force: :cascade do |t|
    t.string "content"
    t.bigint "user_id", null: false
    t.bigint "shoutout_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["shoutout_id"], name: "index_comments_on_shoutout_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "friend_groups", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "friendships", force: :cascade do |t|
    t.bigint "follower_id", null: false
    t.bigint "followee_id", null: false
    t.string "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["followee_id"], name: "index_friendships_on_followee_id"
    t.index ["follower_id"], name: "index_friendships_on_follower_id"
  end

  create_table "group_members", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "friend_group_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["friend_group_id"], name: "index_group_members_on_friend_group_id"
    t.index ["user_id"], name: "index_group_members_on_user_id"
  end

  create_table "mentions", force: :cascade do |t|
    t.bigint "shoutout_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["shoutout_id"], name: "index_mentions_on_shoutout_id"
    t.index ["user_id"], name: "index_mentions_on_user_id"
  end

  create_table "shoutout_likes", force: :cascade do |t|
    t.bigint "shoutout_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["shoutout_id"], name: "index_shoutout_likes_on_shoutout_id"
    t.index ["user_id"], name: "index_shoutout_likes_on_user_id"
  end

  create_table "shoutouts", force: :cascade do |t|
    t.string "content"
    t.bigint "user_id", null: false
    t.string "visibility"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_shoutouts_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "username"
    t.string "password_digest"
    t.string "tagline"
    t.text "bio"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "comment_likes", "comments"
  add_foreign_key "comment_likes", "users"
  add_foreign_key "comments", "shoutouts"
  add_foreign_key "comments", "users"
  add_foreign_key "friendships", "users", column: "followee_id", on_delete: :cascade
  add_foreign_key "friendships", "users", column: "follower_id", on_delete: :cascade
  add_foreign_key "group_members", "friend_groups"
  add_foreign_key "group_members", "users"
  add_foreign_key "mentions", "shoutouts"
  add_foreign_key "mentions", "users"
  add_foreign_key "shoutout_likes", "shoutouts"
  add_foreign_key "shoutout_likes", "users"
  add_foreign_key "shoutouts", "users"
end
