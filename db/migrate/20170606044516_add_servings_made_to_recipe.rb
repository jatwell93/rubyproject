class AddServingsMadeToRecipe < ActiveRecord::Migration
  def change
    add_column :recipes, :servings_made, :integer
  end
end
