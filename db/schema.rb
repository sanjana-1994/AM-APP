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

ActiveRecord::Schema.define(version: 20180914052243) do

  create_table "appointments", force: :cascade do |t|
    t.integer "doctor_id"
    t.integer "patient_id"
    t.datetime "appointment_date"
    t.string "status"
    t.string "patient_image_loc"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["doctor_id"], name: "index_appointments_on_doctor_id"
    t.index ["patient_id"], name: "index_appointments_on_patient_id"
  end

  create_table "doctors", force: :cascade do |t|
    t.string "name"
    t.string "doctor_type"
    t.string "specialization"
    t.string "qualification"
    t.integer "years_of_exp"
    t.integer "rating"
    t.integer "total_ratings"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "doctor_image"
  end

  create_table "patients", force: :cascade do |t|
    t.string "name"
    t.date "birth_date"
    t.string "image_loc"
    t.string "medical_report_loc"
    t.integer "age"
    t.string "gender"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
  end

  create_table "timeslots", force: :cascade do |t|
    t.integer "doctor_id"
    t.integer "time_9_10"
    t.integer "time_10_11"
    t.integer "time_11_12"
    t.integer "time_12_13"
    t.integer "time_13_14"
    t.integer "time_14_15"
    t.integer "time_15_16"
    t.integer "time_16_17"
    t.integer "time_17_18"
    t.integer "time_18_19"
    t.integer "time_19_20"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["doctor_id"], name: "index_timeslots_on_doctor_id"
  end

end
