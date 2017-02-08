class DropBodyweights < ActiveRecord::Migration
  def change
    drop_table :bodyweights
  end
end
