class CreateBooks < ActiveRecord::Migration[7.1]
  def change
    create_table :books do |t|
      t.string :name
      t.string :author
      t.integer :number_of_pages
      t.string :ISBN
      t.string :publisher
      t.date :release_date

      t.timestamps
    end
  end
end
