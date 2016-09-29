class CreatePreptimes < ActiveRecord::Migration
  def change
    create_table :preptimes do |t|
      t.integer :time
    end
  end
end
