class DropCalories < ActiveRecord::Migration
  def change
    drop_table :calories
  end
end
