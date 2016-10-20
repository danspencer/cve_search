require './test/test_helper'
require 'pry'

class CveSearchDatabaseTest < Minitest::Test
  def test_exists
    assert CveSearch::Database
  end

  def test_it_returns_database_info
    VCR.use_cassette('database_info') do
      db_info = CveSearch::Database.version
      assert_equal db_info.dbName, 'cvedb'
      assert_equal db_info.blA, 0
      assert_equal db_info.capecA, 463
      assert_equal db_info.capecU, "Thu, 04 Dec 2014 23:14:41 GMT"
    end
  end
end
