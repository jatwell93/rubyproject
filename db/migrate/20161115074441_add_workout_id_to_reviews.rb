class AddWorkoutIdToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :workout_id, :integer
  end
end
