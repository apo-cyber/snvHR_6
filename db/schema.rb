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

ActiveRecord::Schema.define(version: 2022_05_20_230555) do

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.integer "record_id", null: false
    t.integer "blob_id", null: false
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
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.integer "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "articles", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "careers", force: :cascade do |t|
    t.string "name"
    t.string "workplace"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id", null: false
    t.text "career1"
    t.text "career2"
    t.text "career3"
    t.text "career4"
    t.text "career5"
    t.text "career6"
    t.text "career7"
    t.text "career8"
    t.text "career9"
    t.index ["user_id"], name: "index_careers_on_user_id"
  end

  create_table "posts", force: :cascade do |t|
    t.text "post1"
    t.text "post2"
    t.text "post3"
    t.text "post4"
    t.text "post5"
    t.text "post6"
    t.text "post7"
    t.text "post8"
    t.text "post9"
    t.text "post10"
    t.text "post11"
    t.text "post12"
    t.text "post13"
    t.text "post14"
    t.text "post15"
    t.text "post16"
    t.text "post17"
    t.text "post18"
    t.text "post19"
    t.text "post20"
    t.string "name"
    t.string "workplace"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id", null: false
    t.text "post21"
    t.text "post22"
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "idnumber"
    t.string "name"
    t.string "workplace"
    t.string "email", null: false
    t.string "password_digest", null: false
    t.boolean "retired", default: false, null: false
    t.boolean "admin", default: false, null: false
    t.boolean "root", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "HR", default: false, null: false
    t.date "birth"
    t.date "join_date"
    t.integer "gender"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
end
