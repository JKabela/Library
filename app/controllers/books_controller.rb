require 'nokogiri'
require 'open-uri'
require 'net/http'


class BooksController < ApplicationController
  
  def initialize
    @IMAGE_PATH = './app/assets/images/books'
  end
  def index
    @books = Book.all
  end
  
  def destroy
    @book = Book.find(params[:id])
    @book.destroy

    redirect_to books_path, notice: 'Book was successfully deleted.'
  end
  
  def reset
    Book.destroy_all
	directory_path = @IMAGE_PATH

    # Get a list of all files in the directory
     files = Dir.glob("#{directory_path}/*")

    # Remove each file
    files.each do |file|
    File.delete(file)
end
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
	  @image_url = doc.css('img.ResponsiveImage').attr('src')
	  @book = Book.new(
        name: title,
        author: author,
        number_of_pages: pages,
	    url: url,
		image_path: nil
	 )
	  
    rescue OpenURI::HTTPError => e
      @error_message = "HTTP Error: #{e.message}"
	  puts @error_message
    rescue StandardError => e
      @error_message = "Error: #{e.message}"
	  puts @error_message
    end
  end
  
  def download_book_cover
    url = URI.parse(@image_url)
	url_string = url.to_s
	response = Net::HTTP.get_response(URI.parse(url_string))
	if response.is_a?(Net::HTTPSuccess)
    # Save the image to a local file
      File.open(@IMAGE_PATH + '/' + @book.id.to_s + '.png', 'wb') do |file|
        file.write(response.body)
      end
      puts 'Image downloaded successfully!'
	  @book.update(image_path: @IMAGE_PATH.split('/').last + '/' + @book.id.to_s + '.png')
    else
      puts "Failed to download image. HTTP status code: #{response.code}"
    end
  end

  def scrape
	while !@book.present? || Book.where(name: @book.name).exists?
	  load_book
	end
	book = @book.save
	puts @book
	puts @book.id
	download_book_cover
	redirect_to books_path, notice: 'Book was not successfully created.'
  end
end
