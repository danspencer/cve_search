require './test/test_helper'
require 'pry'
class CveSearchVendorTest < Minitest::Test
  def test_exists
    assert CveSearch
  end

  def test_it_returns_database_info
    VCR.use_cassette('database_info') do
      db_info = CveSearch.database_info
      assert_equal db_info["blA"], 0
    end
  end
end
