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

ActiveRecord::Schema.define(version: 20_201_119_174_831) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'patient_report_files', force: :cascade do |t|
    t.string   'name'
    t.string   'avatar'
    t.datetime 'created_at',        null: false
    t.datetime 'updated_at',        null: false
    t.integer  'patient_id'
    t.integer  'patient_report_id'
  end

  create_table 'patient_reports', force: :cascade do |t|
    t.string   'report_name'
    t.integer  'patient_id'
    t.integer  'report_id'
    t.integer  'report_status_id'
    t.date     'sample_collected_date'
    t.date     'report_date'
    t.text     'comments'
    t.datetime 'created_at',            null: false
    t.datetime 'updated_at',            null: false
  end

  create_table 'patients', force: :cascade do |t|
    t.string   'first_name',    null: false
    t.string   'last_name',     null: false
    t.string   'email',         null: false
    t.string   'mobile_number', null: false
    t.string   'address_line1', null: false
    t.string   'address_line2', null: false
    t.string   'city'
    t.string   'state'
    t.string   'country'
    t.string   'zip'
    t.datetime 'created_at',    null: false
    t.datetime 'updated_at',    null: false
  end

  create_table 'report_statuses', force: :cascade do |t|
    t.string   'name'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'report_types', force: :cascade do |t|
    t.string   'report_type', null: false
    t.string   'extension',   null: false
    t.integer  'report_id'
    t.datetime 'created_at',  null: false
    t.datetime 'updated_at',  null: false
    t.index ['report_id'], name: 'index_report_types_on_report_id', using: :btree
  end

  create_table 'reports', force: :cascade do |t|
    t.string   'report_name',    null: false
    t.integer  'report_type_id'
    t.datetime 'created_at',     null: false
    t.datetime 'updated_at',     null: false
    t.index ['report_type_id'], name: 'index_reports_on_report_type_id', using: :btree
  end

  create_table 'users', force: :cascade do |t|
    t.string   'email',                  default: '', null: false
    t.string   'encrypted_password',     default: '', null: false
    t.string   'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.datetime 'created_at',                          null: false
    t.datetime 'updated_at',                          null: false
    t.index ['email'], name: 'index_users_on_email', unique: true, using: :btree
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true, using: :btree
  end
end
