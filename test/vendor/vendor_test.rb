require './test/test_helper'

class CveSearchVendorTest < Minitest::Test
  def test_exists
    assert CveSearch::Vendor
  end

  def test_it_gives_back_a_single_vendor
    VCR.use_cassette('one_vendor') do
      vendor = CveSearch::Vendor.find('Microsoft')
      assert_equal CveSearch::Vendor, vendor.class
      assert_equal "microsoft", vendor.name
      assert_equal Array, vendor.products.class
      assert_equal 433, vendor.products.length
      assert_equal ".net_framework", vendor.products[0]
    end
  end

  def test_it_gives_back_all_vendors
    VCR.use_cassette('all_vendors') do
      vendors = CveSearch::Vendor.all
      assert_equal 5000, vendors.length
      assert_equal CveSearch::Vendor, vendors[0].class
      assert_equal "%240.99_kindle_books_project", vendors[0].name
    end
  end
end
