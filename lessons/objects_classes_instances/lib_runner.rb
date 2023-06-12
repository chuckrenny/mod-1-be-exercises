require './book'
require './library'

# Create a new library
library = Library.new

# Create three book instances
book1 = Book.new("Harry Potter and the Sorcerer's Stone", "J.K. Rowling", "Fantasy")
book2 = Book.new("To Kill a Mockingbird", "Harper Lee", "Classic")
book3 = Book.new("The Great Gatsby", "F. Scott Fitzgerald", "Classic")

# Add the books to the library
library.add_book(book1)
library.add_book(book2)
library.add_book(book3)

# Print information about the library's collection
puts "Books in the Library's Collection:"
library.titles
puts "\nAuthors in the Library's Collection:"
library.authors
