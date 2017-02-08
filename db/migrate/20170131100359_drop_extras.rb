class DropExtras < ActiveRecord::Migration
  def change
    drop_table :chefs
    drop_table :comment_hierarchies
    drop_table :comments
  end
end
