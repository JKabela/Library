require 'rails_helper'

RSpec.describe Book, type: :model do

  subject { 
    described_class.new(
	  name: 'New book',
	  author: 'John Doe',
	  number_of_pages: 231,
	  image_path: '/image', 
	  url: 'url') 
  }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end
  
  it "is not valid without a name" do
    subject.name = nil
	expect(subject).to_not be_valid
  end
  
  it "is not valid without a author" do
    subject.author = nil
	expect(subject).to_not be_valid
  end
  
  it "is not valid without a number of pages" do
    subject.number_of_pages = nil
    expect(subject).to_not be_valid
  end
  
end