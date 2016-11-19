class AddWorkoutsToMovements < ActiveRecord::Migration
  def change
    add_reference :movements, :workouts, index: true, foreign_key: true
  end
end
