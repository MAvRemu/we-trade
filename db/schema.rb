# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_09_01_125324) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "action_text_rich_texts", force: :cascade do |t|
    t.string "name", null: false
    t.text "body"
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["record_type", "record_id", "name"], name: "index_action_text_rich_texts_uniqueness", unique: true
  end

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
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "chatrooms", force: :cascade do |t|
    t.bigint "squad_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["squad_id"], name: "index_chatrooms_on_squad_id"
  end

  create_table "crypto_bookmarks", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "crypto_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["crypto_id"], name: "index_crypto_bookmarks_on_crypto_id"
    t.index ["user_id"], name: "index_crypto_bookmarks_on_user_id"
  end

  create_table "crypto_comments", force: :cascade do |t|
    t.string "content"
    t.bigint "user_id", null: false
    t.bigint "crypto_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "crypto_comment_id"
    t.index ["crypto_comment_id"], name: "index_crypto_comments_on_crypto_comment_id"
    t.index ["crypto_id"], name: "index_crypto_comments_on_crypto_id"
    t.index ["user_id"], name: "index_crypto_comments_on_user_id"
  end

  create_table "crypto_ratings", force: :cascade do |t|
    t.integer "rating"
    t.bigint "user_id", null: false
    t.bigint "crypto_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["crypto_id"], name: "index_crypto_ratings_on_crypto_id"
    t.index ["user_id"], name: "index_crypto_ratings_on_user_id"
  end

  create_table "cryptos", force: :cascade do |t|
    t.string "name"
    t.string "ticker"
    t.float "price"
    t.float "market_cap"
    t.integer "rank"
    t.float "volume_24h"
    t.float "price_1d"
    t.float "price_1w"
    t.float "price_1m"
    t.float "price_1y"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "id_name"
    t.string "image_url"
  end

  create_table "memberships", force: :cascade do |t|
    t.bigint "squad_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["squad_id"], name: "index_memberships_on_squad_id"
    t.index ["user_id"], name: "index_memberships_on_user_id"
  end

  create_table "post_bookmarks", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "post_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_post_bookmarks_on_post_id"
    t.index ["user_id"], name: "index_post_bookmarks_on_user_id"
  end

  create_table "post_comments", force: :cascade do |t|
    t.string "content"
    t.bigint "user_id", null: false
    t.bigint "post_id", null: false
    t.bigint "post_comment_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_comment_id"], name: "index_post_comments_on_post_comment_id"
    t.index ["post_id"], name: "index_post_comments_on_post_id"
    t.index ["user_id"], name: "index_post_comments_on_user_id"
  end

  create_table "post_votes", force: :cascade do |t|
    t.integer "upvote"
    t.bigint "user_id", null: false
    t.bigint "post_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_post_votes_on_post_id"
    t.index ["user_id"], name: "index_post_votes_on_user_id"
  end

  create_table "posts", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "content"
    t.bigint "squad_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["squad_id"], name: "index_posts_on_squad_id"
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "squad_messages", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "chatroom_id", null: false
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chatroom_id"], name: "index_squad_messages_on_chatroom_id"
    t.index ["user_id"], name: "index_squad_messages_on_user_id"
  end

  create_table "squads", force: :cascade do |t|
    t.boolean "public"
    t.bigint "user_id", null: false
    t.string "title"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "private", default: false
    t.boolean "open", default: true
    t.index ["user_id"], name: "index_squads_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "username", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "chatrooms", "squads"
  add_foreign_key "crypto_bookmarks", "cryptos"
  add_foreign_key "crypto_bookmarks", "users"
  add_foreign_key "crypto_comments", "crypto_comments"
  add_foreign_key "crypto_comments", "cryptos"
  add_foreign_key "crypto_comments", "users"
  add_foreign_key "crypto_ratings", "cryptos"
  add_foreign_key "crypto_ratings", "users"
  add_foreign_key "memberships", "squads"
  add_foreign_key "memberships", "users"
  add_foreign_key "post_bookmarks", "posts"
  add_foreign_key "post_bookmarks", "users"
  add_foreign_key "post_comments", "post_comments"
  add_foreign_key "post_comments", "posts"
  add_foreign_key "post_comments", "users"
  add_foreign_key "post_votes", "posts"
  add_foreign_key "post_votes", "users"
  add_foreign_key "posts", "squads"
  add_foreign_key "posts", "users"
  add_foreign_key "squad_messages", "chatrooms"
  add_foreign_key "squad_messages", "users"
  add_foreign_key "squads", "users"
end
