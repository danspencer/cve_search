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
end
