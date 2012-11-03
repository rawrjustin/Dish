class RemoveCaterers < ActiveRecord::Migration
  def up
    drop_table :caterers
  end

  def down
  end
end
