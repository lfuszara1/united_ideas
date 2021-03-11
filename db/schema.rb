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

ActiveRecord::Schema.define(version: 2021_03_09_101813) do

  create_table "categories", force: :cascade do |t|
    t.integer "category_id"
    t.string "name"
    t.integer "parameters_from"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_categories_on_category_id"
  end

  create_table "decimal_attributes", force: :cascade do |t|
    t.decimal "value"
    t.integer "parameter_id"
    t.integer "product_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["parameter_id"], name: "index_decimal_attributes_on_parameter_id"
    t.index ["product_id"], name: "index_decimal_attributes_on_product_id"
  end

  create_table "hash_attributes", force: :cascade do |t|
    t.integer "parameter_id"
    t.integer "product_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["parameter_id"], name: "index_hash_attributes_on_parameter_id"
    t.index ["product_id"], name: "index_hash_attributes_on_product_id"
  end

  create_table "hash_elements", force: :cascade do |t|
    t.string "value"
    t.integer "hash_attribute_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["hash_attribute_id"], name: "index_hash_elements_on_hash_attribute_id"
  end

  create_table "int_attributes", force: :cascade do |t|
    t.integer "value"
    t.integer "parameter_id"
    t.integer "product_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["parameter_id"], name: "index_int_attributes_on_parameter_id"
    t.index ["product_id"], name: "index_int_attributes_on_product_id"
  end

  create_table "parameters", force: :cascade do |t|
    t.string "name"
    t.boolean "searchable?"
    t.integer "field_type"
    t.integer "category_id"
    t.integer "product_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_parameters_on_category_id"
    t.index ["product_id"], name: "index_parameters_on_product_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.decimal "price"
    t.integer "category_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_products_on_category_id"
  end

  create_table "string_attributes", force: :cascade do |t|
    t.string "value"
    t.integer "parameter_id"
    t.integer "product_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["parameter_id"], name: "index_string_attributes_on_parameter_id"
    t.index ["product_id"], name: "index_string_attributes_on_product_id"
  end

  add_foreign_key "categories", "categories"
end
