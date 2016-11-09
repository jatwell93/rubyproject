class CreateZets < ActiveRecord::Migration
  def change
    create_table :zets do |t|
      t.integer :quantity
      t.belongs_to :exercise, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
