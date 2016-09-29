class RecipeCalories < ActiveRecord::Migration
  def change
    create_table :recipe_calories do |t|
      t.integer :calorie_id, :recipe_id
    end
  end
end
