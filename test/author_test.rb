require './test/test_helper'
require './lib/author'
require './lib/book'

class AuthorTest < Minitest::Test

  def setup
    @charlotte_bronte = Author.new({
      first_name: "Charlotte",
      last_name: "Bronte"
      })
  end

  def test_author_exists_with_first_and_last_name
      assert_instance_of Author, @charlotte_bronte
      assert_equal "Charlotte", @charlotte_bronte.first_name
      assert_equal "Bronte", @charlotte_bronte.last_name
  end

  def test_can_add_books_to_author
    assert_equal [], @charlotte_bronte.books
    @charlotte_bronte.add_book("Jane Eyre", "October 16, 1847")
    assert_equal 1, @charlotte_bronte.books.length
    @charlotte_bronte.add_book("Villette", "1853")
    assert_equal 2, @charlotte_bronte.books.length
    assert_instance_of Book, @charlotte_bronte.books.first
  end
end
