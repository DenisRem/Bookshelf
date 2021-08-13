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

ActiveRecord::Schema.define(version: 2021_07_30_112052) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "authors", force: :cascade do |t|
    t.string "name"
    t.string "avatar"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "book_authors", force: :cascade do |t|
    t.bigint "book_id"
    t.bigint "author_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["author_id"], name: "index_book_authors_on_author_id"
    t.index ["book_id", "author_id"], name: "index_book_authors_on_book_id_and_author_id", unique: true
    t.index ["book_id"], name: "index_book_authors_on_book_id"
  end

  create_table "book_lists", force: :cascade do |t|
    t.bigint "book_id"
    t.bigint "list_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["book_id", "list_id"], name: "index_book_lists_on_book_id_and_list_id", unique: true
    t.index ["book_id"], name: "index_book_lists_on_book_id"
    t.index ["list_id"], name: "index_book_lists_on_list_id"
  end

  create_table "books", force: :cascade do |t|
    t.string "title"
    t.string "publishing_house"
    t.string "language"
    t.integer "year_of_publication"
    t.integer "number_of_pages"
    t.string "format"
    t.string "binding"
    t.string "isbn"
    t.string "avatar"
    t.boolean "availability"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "lists", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_lists_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "role"
    t.string "avatar"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "book_authors", "authors"
  add_foreign_key "book_authors", "books"
  add_foreign_key "book_lists", "books"
  add_foreign_key "book_lists", "lists"
  add_foreign_key "lists", "users"
end
