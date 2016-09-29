class RecipeFeeds < ActiveRecord::Migration
  def change
      create_table :recipe_feeds do |t|
      t.integer :feed_id, :recipe_id
    end
  end
end
