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

ActiveRecord::Schema[7.2].define(version: 2024_10_02_060522) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "business_model_canvases", force: :cascade do |t|
    t.bigint "project_id", null: false
    t.text "key_partners"
    t.text "key_activities"
    t.text "key_resources"
    t.text "value_propositions"
    t.text "customer_relationships"
    t.text "channels"
    t.text "customer_segments"
    t.text "cost_structure"
    t.text "revenue_streams"
    t.text "memo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_business_model_canvases_on_project_id"
  end

  create_table "five_f_analyses", force: :cascade do |t|
    t.bigint "project_id", null: false
    t.text "threat_of_new_entrants"
    t.text "bargaining_power_of_suppliers"
    t.text "bargaining_power_of_buyers"
    t.text "threat_of_substitutes"
    t.text "competitive_rivalry"
    t.text "memo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_five_f_analyses_on_project_id"
  end

  create_table "four_p_analyses", force: :cascade do |t|
    t.bigint "project_id", null: false
    t.text "product"
    t.text "price"
    t.text "place"
    t.text "promotion"
    t.text "memo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_four_p_analyses_on_project_id"
  end

  create_table "memos", force: :cascade do |t|
    t.bigint "project_id", null: false
    t.text "memo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_memos_on_project_id"
  end

  create_table "pest_analyses", force: :cascade do |t|
    t.bigint "project_id", null: false
    t.text "political_factors"
    t.text "economic_factors"
    t.text "social_factors"
    t.text "technological_factors"
    t.text "memo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_pest_analyses_on_project_id"
  end

  create_table "projects", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "title", null: false
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_projects_on_user_id"
  end

  create_table "six_questions", force: :cascade do |t|
    t.bigint "project_id", null: false
    t.text "who"
    t.text "problem"
    t.text "solution"
    t.text "existing_alternatives"
    t.text "market_size"
    t.text "purpose"
    t.text "memo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_six_questions_on_project_id"
  end

  create_table "stp_analyses", force: :cascade do |t|
    t.bigint "project_id", null: false
    t.text "segmentation"
    t.text "targeting"
    t.text "positioning"
    t.text "memo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_stp_analyses_on_project_id"
  end

  create_table "swot_analyses", force: :cascade do |t|
    t.bigint "project_id", null: false
    t.text "strengths"
    t.text "weaknesses"
    t.text "opportunities"
    t.text "threats"
    t.text "memo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_swot_analyses_on_project_id"
  end

  create_table "three_c_analyses", force: :cascade do |t|
    t.bigint "project_id", null: false
    t.text "customer"
    t.text "company"
    t.text "competitor"
    t.text "memo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_three_c_analyses_on_project_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "business_model_canvases", "projects"
  add_foreign_key "five_f_analyses", "projects"
  add_foreign_key "four_p_analyses", "projects"
  add_foreign_key "memos", "projects"
  add_foreign_key "pest_analyses", "projects"
  add_foreign_key "projects", "users"
  add_foreign_key "six_questions", "projects"
  add_foreign_key "stp_analyses", "projects"
  add_foreign_key "swot_analyses", "projects"
  add_foreign_key "three_c_analyses", "projects"
end
