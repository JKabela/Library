class FixColumnName < ActiveRecord::Migration[7.1]
  def self.up
    rename_column :books, :ISBN, :isbn
  end

  def self.down
    rename_column :books, :isbn, :ISBN
  end
end