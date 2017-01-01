class CreateBodyweights < ActiveRecord::Migration
  def change
    create_table :bodyweights do |t|
      t.integer :body_weight
      t.integer :height
      t.integer :bmi
      t.references :user, index: true 

      t.timestamps null: false
    end
    add_foreign_key :exercises, :users
  end
end
