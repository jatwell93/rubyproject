class AddDurationInMinToWorkout < ActiveRecord::Migration
  def change
     add_column :workouts, :duration_in_min, :integer
  end
end
