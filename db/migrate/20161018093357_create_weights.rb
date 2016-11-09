class CreateWeights < ActiveRecord::Migration
  def change
    create_table :weights do |t|
      t.integer :kilogram
      t.belongs_to :exercise, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
