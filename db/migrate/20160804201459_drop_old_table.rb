class DropOldTable < ActiveRecord::Migration
  def change
    drop_table :questions
  end
end
