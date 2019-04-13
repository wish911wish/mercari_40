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

ActiveRecord::Schema.define(version: 20190411132144) do

  create_table "brands", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",        null: false
    t.integer  "category_id", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["category_id"], name: "index_brands_on_category_id", using: :btree
  end

  create_table "categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",       null: false
    t.integer  "parent"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_categories_on_name", using: :btree
  end

  create_table "category_sizes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "category_id"
    t.integer  "size_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["category_id"], name: "index_category_sizes_on_category_id", using: :btree
    t.index ["size_id"], name: "index_category_sizes_on_size_id", using: :btree
  end

  create_table "conditions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "days_for_shipments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "favorites", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "item_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_favorites_on_item_id", using: :btree
    t.index ["user_id"], name: "index_favorites_on_user_id", using: :btree
  end

  create_table "item_images", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "item_id"
    t.string   "image",      null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_item_images_on_item_id", using: :btree
  end

  create_table "items", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "seller_id",                                         null: false
    t.integer  "buyer_id"
    t.string   "name",                                              null: false
    t.text     "description",          limit: 65535
    t.integer  "big_category_id"
    t.integer  "middle_category_id"
    t.integer  "small_category_id"
    t.integer  "brand_id"
    t.integer  "size_id"
    t.integer  "condition_id",                                      null: false
    t.integer  "shipping_cost_id",                                  null: false
    t.integer  "shipping_method_id",                                null: false
    t.string   "sender_prefecture",                                 null: false
    t.integer  "days_for_shipment_id",                              null: false
    t.integer  "status_id",                                         null: false
    t.integer  "price",                                             null: false
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.boolean  "exhibit_flag",                       default: true
    t.index ["big_category_id"], name: "index_items_on_big_category_id", using: :btree
    t.index ["brand_id"], name: "index_items_on_brand_id", using: :btree
    t.index ["buyer_id"], name: "index_items_on_buyer_id", using: :btree
    t.index ["condition_id"], name: "index_items_on_condition_id", using: :btree
    t.index ["days_for_shipment_id"], name: "index_items_on_days_for_shipment_id", using: :btree
    t.index ["middle_category_id"], name: "index_items_on_middle_category_id", using: :btree
    t.index ["name"], name: "index_items_on_name", using: :btree
    t.index ["seller_id"], name: "index_items_on_seller_id", using: :btree
    t.index ["shipping_cost_id"], name: "index_items_on_shipping_cost_id", using: :btree
    t.index ["shipping_method_id"], name: "index_items_on_shipping_method_id", using: :btree
    t.index ["size_id"], name: "index_items_on_size_id", using: :btree
    t.index ["small_category_id"], name: "index_items_on_small_category_id", using: :btree
    t.index ["status_id"], name: "index_items_on_status_id", using: :btree
  end

  create_table "shipping_costs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shipping_methods", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sizes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "size_group"
  end

  create_table "statuses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_evaluations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "evaluator_id", null: false
    t.integer  "evaluatee_id", null: false
    t.integer  "evaluation",   null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["evaluatee_id"], name: "index_user_evaluations_on_evaluatee_id", using: :btree
    t.index ["evaluator_id"], name: "index_user_evaluations_on_evaluator_id", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "nickname",                            null: false
    t.string   "family_name",                         null: false
    t.string   "first_name",                          null: false
    t.string   "family_name_kana",                    null: false
    t.string   "first_name_kana",                     null: false
    t.date     "birthday",                            null: false
    t.string   "postal_code"
    t.string   "prefectures"
    t.string   "city"
    t.string   "street_address"
    t.string   "building"
    t.string   "phone_number"
    t.string   "introduction"
    t.string   "image"
    t.string   "uid"
    t.string   "provider"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "category_sizes", "categories"
  add_foreign_key "category_sizes", "sizes"
  add_foreign_key "favorites", "items"
  add_foreign_key "favorites", "users"
  add_foreign_key "item_images", "items"
  add_foreign_key "items", "brands"
  add_foreign_key "items", "categories", column: "big_category_id"
  add_foreign_key "items", "categories", column: "middle_category_id"
  add_foreign_key "items", "categories", column: "small_category_id"
  add_foreign_key "items", "conditions"
  add_foreign_key "items", "days_for_shipments"
  add_foreign_key "items", "shipping_costs"
  add_foreign_key "items", "shipping_methods"
  add_foreign_key "items", "sizes"
  add_foreign_key "items", "statuses"
  add_foreign_key "items", "users", column: "buyer_id"
  add_foreign_key "items", "users", column: "seller_id"
  add_foreign_key "user_evaluations", "users", column: "evaluatee_id"
  add_foreign_key "user_evaluations", "users", column: "evaluator_id"
end
