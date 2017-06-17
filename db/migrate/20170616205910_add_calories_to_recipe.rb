class AddCaloriesToRecipe < ActiveRecord::Migration
  def change
    add_column :recipes, :calories, :integer
  end
end
