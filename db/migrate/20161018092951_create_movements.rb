class CreateMovements < ActiveRecord::Migration
  def change
    create_table :movements do |t|
      t.string :name
      t.belongs_to :exercise, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
