class CreateCalories < ActiveRecord::Migration
  def change
    create_table :calories do |t|
      t.integer :amount
    end
  end
end
