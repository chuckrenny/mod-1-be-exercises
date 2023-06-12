# Define the Book class
class Book
    # Define attribute readers for title, author, and genre
    attr_reader :title, :author, :genre

    # Define the initialize method to set the initial values of title, author, and genre
    def initialize(title, author, genre)
        @title = title
        @author = author
        @genre = genre
    end
end

# Define the Library class
class Library
    # Define the initialize method to initialize the collection as an empty array
    def initialize
        @collection = []
    end

    # Define the add_book method to add a book to the collection
    def add_book(book)
        @collection << book
    end

    # Define the titles method to print the titles of all books in the collection
    def titles
        # Iterate over each book in the collection
        @collection.each do |book|
            # Print the title of the book
            puts book.title
        end
    end

    # Define the authors method to print the authors of all books in the collection
    def authors
        # Create an empty array to store unique authors
        authors = []

        # Iterate over each book in the collection
        @collection.each do |book|
            # Check if the authors array does not include the author of the current book
            if authors.include?(book.author) == false
                # Print the author of the book
                puts book.author

                # Add the author to the authors array to avoid duplicates
                authors << book.author
            end
        end
    end
end
