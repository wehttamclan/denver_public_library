require './test/test_helper'
require './lib/book'

class BookTest < Minitest::Test
  def test_book_has_author_title_and_publication_date
    book = Book.new({
      author_first_name: "Harper",
      author_last_name: "Lee",
      title: "To Kill a Mockingbird",
      publication_date: "July 11, 1960"
      })
    assert_equal "Harper", book.author_first_name
    assert_equal "Lee", book.author_last_name
    assert_equal "To Kill a Mockingbird", book.title
    assert_equal "July 11, 1960", book.publication_date
  end
end
