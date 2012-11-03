class CreateCaterers < ActiveRecord::Migration
  def change
    create_table :caterers do |t|
      t.integer :phone
      t.string :name
      t.string :address

      t.timestamps
    end
  end
end
