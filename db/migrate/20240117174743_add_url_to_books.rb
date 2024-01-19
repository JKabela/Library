class AddUrlToBooks < ActiveRecord::Migration[7.1]
  def change
    add_column :books, :url, :string
  end
end
