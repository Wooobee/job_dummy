# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150216231425) do

  create_table "refinery_image_page_translations", force: true do |t|
    t.integer  "refinery_image_page_id", null: false
    t.string   "locale",                 null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "caption"
  end

  add_index "refinery_image_page_translations", ["locale"], name: "index_refinery_image_page_translations_on_locale"
  add_index "refinery_image_page_translations", ["refinery_image_page_id"], name: "index_186c9a170a0ab319c675aa80880ce155d8f47244"

  create_table "refinery_image_pages", force: true do |t|
    t.integer "image_id"
    t.integer "page_id"
    t.integer "position"
    t.text    "caption"
    t.string  "page_type", default: "page"
  end

  add_index "refinery_image_pages", ["image_id"], name: "index_refinery_image_pages_on_image_id"
  add_index "refinery_image_pages", ["page_id"], name: "index_refinery_image_pages_on_page_id"

  create_table "refinery_images", force: true do |t|
    t.string   "image_mime_type"
    t.string   "image_name"
    t.integer  "image_size"
    t.integer  "image_width"
    t.integer  "image_height"
    t.string   "image_uid"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_title"
    t.string   "image_alt"
  end

  create_table "refinery_inquiries_inquiries", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.text     "message"
    t.boolean  "spam",       default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "refinery_inquiries_inquiries", ["id"], name: "index_refinery_inquiries_inquiries_on_id"

  create_table "refinery_job_applications", force: true do |t|
    t.integer  "job_id"
    t.string   "name"
    t.string   "phone"
    t.string   "email"
    t.text     "cover_letter"
    t.string   "resume_uid"
    t.string   "resume_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "refinery_job_applications", ["id"], name: "index_refinery_job_applications_on_id"
  add_index "refinery_job_applications", ["job_id"], name: "index_refinery_job_applications_on_job_id"

  create_table "refinery_job_translations", force: true do |t|
    t.integer  "refinery_job_id", null: false
    t.string   "locale",          null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
    t.text     "description"
    t.string   "slug"
    t.string   "education"
    t.string   "experience"
    t.string   "skills"
    t.string   "languages"
    t.string   "salary"
    t.string   "length"
    t.string   "contact"
  end

  add_index "refinery_job_translations", ["locale"], name: "index_refinery_job_translations_on_locale"
  add_index "refinery_job_translations", ["refinery_job_id"], name: "index_refinery_job_translations_on_refinery_job_id"

  create_table "refinery_jobs", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "employment_terms"
    t.string   "hours"
    t.integer  "position"
    t.boolean  "enabled"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
    t.boolean  "draft"
    t.datetime "published_at"
    t.integer  "fill",             default: 1
    t.string   "ref"
    t.string   "education"
    t.string   "experience"
    t.string   "skills"
    t.string   "languages"
    t.string   "salary"
    t.string   "length"
    t.date     "employment_date"
    t.string   "contact"
  end

  add_index "refinery_jobs", ["id"], name: "index_refinery_jobs_on_id"
  add_index "refinery_jobs", ["slug"], name: "index_refinery_jobs_on_slug"

  create_table "refinery_page_part_translations", force: true do |t|
    t.integer  "refinery_page_part_id", null: false
    t.string   "locale",                null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "body"
  end

  add_index "refinery_page_part_translations", ["locale"], name: "index_refinery_page_part_translations_on_locale"
  add_index "refinery_page_part_translations", ["refinery_page_part_id"], name: "index_refinery_page_part_translations_on_refinery_page_part_id"

  create_table "refinery_page_parts", force: true do |t|
    t.integer  "refinery_page_id"
    t.string   "title"
    t.text     "body"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "refinery_page_parts", ["id"], name: "index_refinery_page_parts_on_id"
  add_index "refinery_page_parts", ["refinery_page_id"], name: "index_refinery_page_parts_on_refinery_page_id"

  create_table "refinery_page_translations", force: true do |t|
    t.integer  "refinery_page_id", null: false
    t.string   "locale",           null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
    t.string   "custom_slug"
    t.string   "menu_title"
    t.string   "slug"
  end

  add_index "refinery_page_translations", ["locale"], name: "index_refinery_page_translations_on_locale"
  add_index "refinery_page_translations", ["refinery_page_id"], name: "index_refinery_page_translations_on_refinery_page_id"

  create_table "refinery_pages", force: true do |t|
    t.integer  "parent_id"
    t.string   "path"
    t.string   "slug"
    t.string   "custom_slug"
    t.boolean  "show_in_menu",        default: true
    t.string   "link_url"
    t.string   "menu_match"
    t.boolean  "deletable",           default: true
    t.boolean  "draft",               default: false
    t.boolean  "skip_to_first_child", default: false
    t.integer  "lft"
    t.integer  "rgt"
    t.integer  "depth"
    t.string   "view_template"
    t.string   "layout_template"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "refinery_pages", ["depth"], name: "index_refinery_pages_on_depth"
  add_index "refinery_pages", ["id"], name: "index_refinery_pages_on_id"
  add_index "refinery_pages", ["lft"], name: "index_refinery_pages_on_lft"
  add_index "refinery_pages", ["parent_id"], name: "index_refinery_pages_on_parent_id"
  add_index "refinery_pages", ["rgt"], name: "index_refinery_pages_on_rgt"

  create_table "refinery_resources", force: true do |t|
    t.string   "file_mime_type"
    t.string   "file_name"
    t.integer  "file_size"
    t.string   "file_uid"
    t.string   "file_ext"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "refinery_roles", force: true do |t|
    t.string "title"
  end

  create_table "refinery_roles_users", id: false, force: true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "refinery_roles_users", ["role_id", "user_id"], name: "index_refinery_roles_users_on_role_id_and_user_id"
  add_index "refinery_roles_users", ["user_id", "role_id"], name: "index_refinery_roles_users_on_user_id_and_role_id"

  create_table "refinery_settings", force: true do |t|
    t.string   "name"
    t.text     "value"
    t.boolean  "destroyable",     default: true
    t.string   "scoping"
    t.boolean  "restricted",      default: false
    t.string   "form_value_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
    t.string   "title"
  end

  add_index "refinery_settings", ["name"], name: "index_refinery_settings_on_name"

  create_table "refinery_user_plugins", force: true do |t|
    t.integer "user_id"
    t.string  "name"
    t.integer "position"
  end

  add_index "refinery_user_plugins", ["name"], name: "index_refinery_user_plugins_on_name"
  add_index "refinery_user_plugins", ["user_id", "name"], name: "index_refinery_user_plugins_on_user_id_and_name", unique: true

  create_table "refinery_users", force: true do |t|
    t.string   "username",               null: false
    t.string   "email",                  null: false
    t.string   "encrypted_password",     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "sign_in_count"
    t.datetime "remember_created_at"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
    t.string   "full_name"
  end

  add_index "refinery_users", ["id"], name: "index_refinery_users_on_id"
  add_index "refinery_users", ["slug"], name: "index_refinery_users_on_slug"

  create_table "seo_meta", force: true do |t|
    t.integer  "seo_meta_id"
    t.string   "seo_meta_type"
    t.string   "browser_title"
    t.text     "meta_description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "seo_meta", ["id"], name: "index_seo_meta_on_id"
  add_index "seo_meta", ["seo_meta_id", "seo_meta_type"], name: "id_type_index_on_seo_meta"

end
