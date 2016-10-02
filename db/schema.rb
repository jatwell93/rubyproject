

ActiveRecord::Schema.define(version: 20161002023224) do

  create_table "calories", force: :cascade do |t|
    t.integer "amount"
  end

  create_table "chefs", force: :cascade do |t|
    t.string   "chefname"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.boolean  "admin",           default: false
  end

  create_table "comment_hierarchies", id: false, force: :cascade do |t|
    t.integer "ancestor_id",   null: false
    t.integer "descendant_id", null: false
    t.integer "generations",   null: false
  end

  add_index "comment_hierarchies", ["ancestor_id", "descendant_id", "generations"], name: "comment_anc_desc_udx", unique: true
  add_index "comment_hierarchies", ["descendant_id"], name: "comment_desc_idx"

  create_table "comments", force: :cascade do |t|
    t.string   "title"
    t.string   "author"
    t.text     "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "parent_id"
  end

  create_table "directions", force: :cascade do |t|
    t.text     "step"
    t.integer  "recipe_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "directions", ["recipe_id"], name: "index_directions_on_recipe_id"

  create_table "feeds", force: :cascade do |t|
    t.integer "people"
  end

  create_table "ingredients", force: :cascade do |t|
    t.string   "name"
    t.integer  "recipe_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "ingredients", ["recipe_id"], name: "index_ingredients_on_recipe_id"

  create_table "likes", force: :cascade do |t|
    t.boolean  "like"
    t.integer  "chef_id"
    t.integer  "recipe_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "preptimes", force: :cascade do |t|
    t.integer "time"
  end

  create_table "recipe_calories", force: :cascade do |t|
    t.integer "calorie_id"
    t.integer "recipe_id"
  end

  create_table "recipe_feeds", force: :cascade do |t|
    t.integer "feed_id"
    t.integer "recipe_id"
  end

  create_table "recipe_ingredients", force: :cascade do |t|
    t.integer "ingredient_id"
    t.integer "recipe_id"
  end

  create_table "recipe_preptimes", force: :cascade do |t|
    t.integer "preptime_id"
    t.integer "recipe_id"
  end

  create_table "recipe_styles", force: :cascade do |t|
    t.integer "style_id"
    t.integer "recipe_id"
  end

  create_table "recipes", force: :cascade do |t|
    t.string   "name"
    t.text     "summary"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "chef_id"
    t.string   "picture"
  end

  create_table "reviews", force: :cascade do |t|
    t.text     "body"
    t.integer  "chef_id"
    t.integer  "recipe_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "styles", force: :cascade do |t|
    t.string "name"
  end

end
