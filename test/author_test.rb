require './test/test_helper'
require './lib/author'
class AuthorTest < Minitest::Test

  def test_author_exists_with_first_and_last_name
    charlotte_bronte = Author.new({
      first_name: "Charlotte",
      last_name: "Bronte"
      })
      assert_instance_of Author, charlotte_bronte
      assert_equal "Charlotte", charlotte_bronte.first_name
      assert_equal "Bronte", charlotte_bronte.last_name
  end

end
