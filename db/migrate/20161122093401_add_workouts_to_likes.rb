class AddWorkoutsToLikes < ActiveRecord::Migration
  def change
    add_column :likes, :workout_id, :integer
  end
end
