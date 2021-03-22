# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_03_18_222810) do

  create_table "abstracts", force: :cascade do |t|
    t.text "problem"
    t.text "methodology"
    t.text "feasibility"
    t.text "results"
    t.text "impact"
    t.integer "project_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["project_id"], name: "index_abstracts_on_project_id"
  end

  create_table "administrators", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "collaborators", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "major"
    t.string "student_code"
    t.integer "project_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["project_id"], name: "index_collaborators_on_project_id"
  end

  create_table "committee_evaluations", force: :cascade do |t|
    t.integer "description"
    t.integer "problem"
    t.integer "methodology"
    t.integer "feasibility"
    t.integer "results"
    t.integer "impact"
    t.integer "score"
    t.integer "project_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "ortography"
    t.index ["project_id"], name: "index_committee_evaluations_on_project_id"
  end

  create_table "committee_members", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "courses", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "departments", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "editions", force: :cascade do |t|
    t.string "name"
    t.date "start_date"
    t.date "end_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "institutions", force: :cascade do |t|
    t.string "name"
    t.string "city"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "judge_evaluations", force: :cascade do |t|
    t.integer "judge_id", null: false
    t.integer "project_id", null: false
    t.integer "score"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["judge_id"], name: "index_judge_evaluations_on_judge_id"
    t.index ["project_id"], name: "index_judge_evaluations_on_project_id"
  end

  create_table "judges", force: :cascade do |t|
    t.string "company"
    t.string "department"
    t.string "contact_name"
    t.string "contact_email"
    t.boolean "has_tablet"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "operatives", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "professors", force: :cascade do |t|
    t.string "department"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "project_areas", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "project_categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "project_details", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.text "video_url"
    t.boolean "semestre_i"
    t.boolean "social_impact"
    t.string "client_type"
    t.integer "project_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "category"
    t.string "area"
    t.string "type_of"
    t.index ["project_id"], name: "index_project_details_on_project_id"
  end

  create_table "project_event_details", force: :cascade do |t|
    t.integer "stand"
    t.integer "final_score"
    t.integer "project_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["project_id"], name: "index_project_event_details_on_project_id"
  end

  create_table "projects", force: :cascade do |t|
    t.integer "status"
    t.integer "student_id", null: false
    t.integer "professor_id", null: false
    t.integer "institution_id", null: false
    t.integer "edition_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["edition_id"], name: "index_projects_on_edition_id"
    t.index ["institution_id"], name: "index_projects_on_institution_id"
    t.index ["professor_id"], name: "index_projects_on_professor_id"
    t.index ["student_id"], name: "index_projects_on_student_id"
  end

  create_table "questions", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.integer "edition_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["edition_id"], name: "index_questions_on_edition_id"
  end

  create_table "social_impacts", force: :cascade do |t|
    t.text "problem"
    t.text "empathy"
    t.text "responsibility"
    t.integer "project_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["project_id"], name: "index_social_impacts_on_project_id"
  end

  create_table "staff_members", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "students", force: :cascade do |t|
    t.string "major"
    t.string "student_code"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "time_limits", force: :cascade do |t|
    t.text "phase_name"
    t.date "start_date"
    t.date "end_date"
    t.integer "edition_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["edition_id"], name: "index_time_limits_on_edition_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "status"
    t.string "first_name"
    t.string "last_name"
    t.integer "userable_id"
    t.string "userable_type"
    t.integer "edition_id", null: false
    t.integer "institution_id", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "virtual_samples", force: :cascade do |t|
    t.text "video_link"
    t.integer "project_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["project_id"], name: "index_virtual_samples_on_project_id"
  end

  add_foreign_key "abstracts", "projects"
  add_foreign_key "collaborators", "projects"
  add_foreign_key "committee_evaluations", "projects"
  add_foreign_key "judge_evaluations", "judges"
  add_foreign_key "judge_evaluations", "projects"
  add_foreign_key "project_details", "projects"
  add_foreign_key "project_event_details", "projects"
  add_foreign_key "projects", "editions"
  add_foreign_key "projects", "institutions"
  add_foreign_key "projects", "professors"
  add_foreign_key "projects", "students"
  add_foreign_key "questions", "editions"
  add_foreign_key "social_impacts", "projects"
  add_foreign_key "time_limits", "editions"
  add_foreign_key "virtual_samples", "projects"
end
