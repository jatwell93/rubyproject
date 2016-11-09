class CreateReps < ActiveRecord::Migration
  def change
    create_table :reps do |t|
      t.integer :amount
      t.belongs_to :exercise, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
