class Library
  attr_reader :books

  def initialize
    @books = []
    # @card_catalogue = card_catalogue
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
end
