class AddPreptimesToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :prep_times, :integer
  end
end
