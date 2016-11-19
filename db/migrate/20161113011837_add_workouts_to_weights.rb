class AddWorkoutsToWeights < ActiveRecord::Migration
  def change
    add_reference :weights, :workouts, index: true, foreign_key: true
  end
end
