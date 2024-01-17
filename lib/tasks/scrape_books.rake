namespace :scrape do
  desc "Scrape books"
  task run: :environment do
    BooksController.new.scrape
  end
end