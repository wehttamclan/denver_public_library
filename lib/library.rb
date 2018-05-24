class Library
  attr_reader :books

  def initialize
    @books = []
  end

  def add_to_collection(book)
    @books << book
  end

  def include?(book_title)
    @books.any? { |book| book.title == book_title }
  end

  def card_catalogue
    @books.sort_by { |book| book.author_last_name }
  end

  def find_by_author(author_name)
    first_name, last_name = author_name.split[0], author_name.split[1]
    books_by_author = books.select do |book|
      book.author_first_name == first_name && book.author_last_name == last_name
    end
    book_titles = books_by_author.map { |book| book.title }
    book_titles.product(books_by_author).to_h
  end

  def find_by_publication_date(year)
    books_by_date = books.select do |book|
      book.publication_date.split.last == year
    end
    book_titles = books_by_date.map { |book| book.title }
    book_titles.product(books_by_date).to_h
  end
end
