class RemoveUserFromRecipes < ActiveRecord::Migration
  def change
    remove_column :recipes, :user, :integer
  end
end
