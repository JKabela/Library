class Book < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :author
  validates_presence_of :number_of_pages
  validates_presence_of :isbn
  validates_presence_of :publisher
  validates_presence_of :release_date
end
