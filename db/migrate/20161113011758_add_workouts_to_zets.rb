class AddWorkoutsToZets < ActiveRecord::Migration
  def change
    add_reference :zets, :workouts, index: true, foreign_key: true
  end
end
