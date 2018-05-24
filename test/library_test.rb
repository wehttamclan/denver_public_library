require './test/test_helper'
require './lib/library'

class LibraryTest < Minitest::Test

  def test_library_can_add_to_collection
    charlotte_bronte = Author.new({
      first_name: "Charlotte",
      last_name: "Bronte"
      })
    jane_eyre = charlotte_bronte.add_book("Jane Eyre", "October 16, 1847")
    villette  = charlotte_bronte.add_book("Villette", "1853")

    harper_lee  = Author.new({first_name: "Harper", last_name: "Lee"})
    mockingbird = harper_lee.add_book("To Kill a Mockingbird", "July 11, 1960")

    dpl = Library.new

    assert_equal [], dpl.books
    dpl.add_to_collection(jane_eyre)
    assert_instance_of Book, dpl.books.first
    assert_equal 1, dpl.books.length
    assert_equal charlotte_bronte.books.first, dpl.books.first

    dpl.add_to_collection(mockingbird)
    dpl.add_to_collection(villette)
    assert dpl.books.all? { |book| book.class }
    assert_equal 3, dpl.books.length
  end

  def test_library_can_return_book_info
    charlotte_bronte = Author.new({
      first_name: "Charlotte",
      last_name: "Bronte"
      })
    jane_eyre = charlotte_bronte.add_book("Jane Eyre", "October 16, 1847")
    villette  = charlotte_bronte.add_book("Villette", "1853")

    harper_lee  = Author.new({first_name: "Harper", last_name: "Lee"})
    mockingbird = harper_lee.add_book("To Kill a Mockingbird", "July 11, 1960")

    dpl = Library.new
    dpl.add_to_collection(jane_eyre)
    dpl.add_to_collection(mockingbird)
    dpl.add_to_collection(villette)

    assert dpl.include?("To Kill a Mockingbird")
    refute dpl.include?("A Connecticut Yankee in King Arthur's Court")
  end
end
