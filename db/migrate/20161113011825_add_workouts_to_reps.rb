class AddWorkoutsToReps < ActiveRecord::Migration
  def change
    add_reference :reps, :workouts, index: true, foreign_key: true
  end
end
