class ChangeDataTypeForPhone < ActiveRecord::Migration
  def self.up
    change_table :meals do |t|
      t.change :phone, :string
    end
  end
end
