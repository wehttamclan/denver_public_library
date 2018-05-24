class Author
  attr_reader :first_name, :last_name, :books

  def initialize(args)
    @first_name = args[:first_name]
    @last_name  = args[:last_name]
    @books      = []
  end

  def add_book(title, publication_date)
    data = {
      author_first_name: @first_name,
      author_last_name: @last_name,
      title: title,
      publication_date: publication_date
    }
    book = Book.new(data)
    @books << book
    book
  end
end
