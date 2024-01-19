class RemoveColumnsFromBooks < ActiveRecord::Migration[7.1]
  def change
    remove_column :books, :isbn, :string
    remove_column :books, :publisher, :string
    remove_column :books, :release_date, :date
  end
end
