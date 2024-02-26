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

ActiveRecord::Schema[7.1].define(version: 2024_02_24_084519) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "acquirers", primary_key: "acquirer_name", id: :string, force: :cascade do |t|
    t.string "website_url", null: false
    t.string "acquirer_email", null: false
    t.string "city"
    t.string "status", default: "Active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["acquirer_name"], name: "index_acquirers_on_acquirer_name", unique: true
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

  create_table "banks", force: :cascade do |t|
    t.string "bankname"
    t.string "divid"
    t.string "bankurl"
    t.string "status", default: "Active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "business_subcategories", force: :cascade do |t|
    t.string "subcategoryname"
    t.string "categoryname"
    t.string "status", default: "Active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "businesstypes", force: :cascade do |t|
    t.string "businesstypename"
    t.string "status", default: "Active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string "categoryname"
    t.string "shortname"
    t.string "status", default: "Active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clients", primary_key: "company_name", id: :string, force: :cascade do |t|
    t.string "company_type"
    t.string "website_url", null: false
    t.string "company_email", null: false
    t.string "city"
    t.string "status", default: "Active"
    t.string "acquirer_name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "last_settled_date"
    t.index ["company_name"], name: "index_clients_on_company_name", unique: true
  end

  create_table "currencies", force: :cascade do |t|
    t.string "currencyname"
    t.string "currencycode"
    t.string "status", default: "Active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "document_categories", force: :cascade do |t|
    t.string "documentname"
    t.string "documenttype"
    t.string "side"
    t.integer "documentnumberlength"
    t.string "status", default: "Active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "document_types", force: :cascade do |t|
    t.string "documenttype"
    t.string "status", default: "Active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rates", force: :cascade do |t|
    t.string "settlement_scheme"
    t.decimal "MDR", precision: 10, scale: 2
    t.decimal "txn_app", precision: 10, scale: 2
    t.decimal "txn_dec", precision: 10, scale: 2
    t.decimal "txn_total", precision: 10, scale: 2
    t.decimal "RR", precision: 10, scale: 2
    t.decimal "settlement_fee", precision: 10, scale: 2
    t.string "company_name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "settlements", force: :cascade do |t|
    t.date "date_settled"
    t.decimal "total_volume", precision: 10, scale: 2
    t.decimal "settlement_volume", precision: 10, scale: 2
    t.string "status", default: "Pending"
    t.string "company_name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tables", id: false, force: :cascade do |t|
    t.string "txnid", null: false
    t.string "paymentgateway", null: false
    t.string "merchantTxnId"
    t.string "merchant", null: false
    t.string "orderNo"
    t.string "MID"
    t.string "cname", null: false
    t.string "email"
    t.string "cardnumber", null: false
    t.string "cardtype", null: false
    t.string "country", null: false
    t.decimal "amount", precision: 10, scale: 2, null: false
    t.string "currency", null: false
    t.string "Status", default: "Pending"
    t.text "message", default: "Transaction is in process"
    t.string "pdate"
    t.integer "router"
    t.string "webURL"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "transactiondate"
  end

  create_table "transactiontables", force: :cascade do |t|
    t.string "txnid", null: false
    t.string "paymentgateway", null: false
    t.string "merchantTxnId"
    t.string "merchant", null: false
    t.string "orderNo"
    t.string "MID"
    t.string "cname", null: false
    t.string "email"
    t.string "cardnumber", null: false
    t.string "cardtype", null: false
    t.string "country", null: false
    t.decimal "amount", precision: 10, scale: 2, null: false
    t.string "currency", null: false
    t.string "transactiondate"
    t.string "Status", default: "Pending"
    t.text "message", default: "Transaction is in process"
    t.datetime "pdate"
    t.integer "router"
    t.string "webURL"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", primary_key: "email", id: :string, force: :cascade do |t|
    t.string "name", null: false
    t.string "mobile_no"
    t.string "country"
    t.string "company_name", null: false
    t.string "role", default: "user", null: false
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "clients", "acquirers", column: "acquirer_name", primary_key: "acquirer_name"
  add_foreign_key "rates", "clients", column: "company_name", primary_key: "company_name"
  add_foreign_key "settlements", "clients", column: "company_name", primary_key: "company_name"
  add_foreign_key "users", "clients", column: "company_name", primary_key: "company_name"
end
