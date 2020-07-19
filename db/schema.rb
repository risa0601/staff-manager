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

ActiveRecord::Schema.define(version: 20200719135835) do

  create_table "having_skills", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.integer  "skill_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["skill_id"], name: "index_having_skills_on_skill_id", using: :btree
    t.index ["user_id", "skill_id"], name: "index_having_skills_on_user_id_and_skill_id", unique: true, using: :btree
    t.index ["user_id"], name: "index_having_skills_on_user_id", using: :btree
  end

  create_table "parties", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "party_start"
    t.string   "station"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "shift_dicisioins", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.integer  "party_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["party_id"], name: "index_shift_dicisioins_on_party_id", using: :btree
    t.index ["user_id", "party_id"], name: "index_shift_dicisioins_on_user_id_and_party_id", unique: true, using: :btree
    t.index ["user_id"], name: "index_shift_dicisioins_on_user_id", using: :btree
  end

  create_table "shifts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.date     "date"
    t.text     "category",   limit: 65535
    t.integer  "user_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["user_id"], name: "index_shifts_on_user_id", using: :btree
  end

  create_table "skills", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "skill_name"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_skills_on_user_id", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",                             null: false
    t.integer  "staff_no",                         null: false
    t.string   "crypted_password"
    t.string   "salt"
    t.string   "trip"
    t.string   "party_type"
    t.boolean  "admin",            default: false, null: false
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  add_foreign_key "having_skills", "skills"
  add_foreign_key "having_skills", "users"
  add_foreign_key "shift_dicisioins", "parties"
  add_foreign_key "shift_dicisioins", "users"
  add_foreign_key "shifts", "users"
  add_foreign_key "skills", "users"
end
