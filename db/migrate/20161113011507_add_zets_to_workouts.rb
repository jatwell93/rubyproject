class AddZetsToWorkouts < ActiveRecord::Migration
  def change
    add_reference :workouts, :zets, index: true, foreign_key: true
  end
end
