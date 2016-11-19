class CreateWorkouts < ActiveRecord::Migration
  def change
    create_table :workouts do |t|
      t.string :name
      t.text :summary
      t.integer :user_id
      t.string :attachment

      t.timestamps null: false
    end
  end
end
