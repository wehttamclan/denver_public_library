require './test/test_helper'
require './lib/library'

class LibraryTest < Minitest::Test

  def setup
    @charlotte_bronte = Author.new({
      first_name: "Charlotte",
      last_name: "Bronte"
      })
    @jane_eyre = @charlotte_bronte.add_book("Jane Eyre", "October 16, 1847")
    @villette  = @charlotte_bronte.add_book("Villette", "1853")
    @harper_lee  = Author.new({first_name: "Harper", last_name: "Lee"})
    @mockingbird = @harper_lee.add_book("To Kill a Mockingbird", "July 11, 1960")
    @dpl = Library.new
  end

  def test_library_can_add_to_collection
    assert_equal [], @dpl.books
    @dpl.add_to_collection(@jane_eyre)
    assert_instance_of Book, @dpl.books.first
    assert_equal 1, @dpl.books.length
    assert_equal @charlotte_bronte.books.first, @dpl.books.first

    @dpl.add_to_collection(@mockingbird)
    @dpl.add_to_collection(@villette)
    assert @dpl.books.all? { |book| book.class }
    assert_equal 3, @dpl.books.length
  end

  def test_library_can_return_book_info
    @dpl.add_to_collection(@jane_eyre)
    @dpl.add_to_collection(@mockingbird)
    @dpl.add_to_collection(@villette)

    assert @dpl.include?("To Kill a Mockingbird")
    refute @dpl.include?("A Connecticut Yankee in King Arthur's Court")
  end

  def test_card_catalogue_returns_sorted_books_by_author_last_name
    @dpl.add_to_collection(@jane_eyre)
    @dpl.add_to_collection(@mockingbird)
    @dpl.add_to_collection(@villette)

    assert_equal "Bronte", @dpl.card_catalogue.first.author_last_name
    assert_equal "Lee", @dpl.card_catalogue.last.author_last_name
  end

  def test_find_by_author
    @dpl.add_to_collection(@jane_eyre)
    @dpl.add_to_collection(@mockingbird)
    @dpl.add_to_collection(@villette)

    expected = @charlotte_bronte.books.first.title
    assert  @dpl.find_by_author("Charlotte Bronte").keys.include?(expected)

    expected = @charlotte_bronte.books.last.title
    assert  @dpl.find_by_author("Charlotte Bronte").keys.include?(expected)
  end

  def test_find_by_publication_date
    @dpl.add_to_collection(@jane_eyre)
    @dpl.add_to_collection(@mockingbird)
    @dpl.add_to_collection(@villette)

    expected = @mockingbird.title
    assert  @dpl.find_by_publication_date("1960").keys.include?(expected)
  end
end
