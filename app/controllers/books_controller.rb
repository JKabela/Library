require 'nokogiri'
require 'open-uri'

class BooksController < ApplicationController
  def index
    @books = Book.all
  end
  
  def reset
    Book.destroy_all
	redirect_to books_path
  end
  
  def load_book
    url = 'https://www.goodreads.com/book/show/' + rand(1..50000).to_s
	begin
	  uri = URI.parse(url)
      html = uri.open
      doc = Nokogiri::HTML(html)
	  title = doc.css('div.BookPageTitleSection__title').text.strip
	  author = doc.css('span.ContributorLink__name').first.text.strip
	  pages = doc.css('div.FeaturedDetails').text.strip.split(" ")[0]
	  @book = Book.new(
        name: title,
        author: author,
        number_of_pages: pages,
	    isbn: 'isbn',
	    publisher: 'publisher',
	    release_date: Date.current
	 )
	  
    rescue OpenURI::HTTPError => e
      @error_message = "HTTP Error: #{e.message}"
	  puts @error_message
    rescue StandardError => e
      @error_message = "Error: #{e.message}"
	  puts @error_message
    end
  end

  def scrape
    load_book
	while Book.where(name: @book.name).exists?
	  load_book
	end
	  @book.save
	redirect_to books_path, notice: 'Book was not successfully created.'
  end
end
