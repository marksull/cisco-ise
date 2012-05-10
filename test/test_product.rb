require 'helper'

class TestProduct < MiniTest::Unit::TestCase

  def test_product_with_good_node

    product = CiscoISE::Product.new(get_product_xml(@type_of_node_good))

    # Let make sure all the data is parsed correctly
    assert_instance_of  CiscoISE::Product, product
    assert_equal        product.name, @name
    assert_equal        product.type_of_node, @type_of_node_good
    assert_equal        product.type_of_node_as_code, @type_of_node_good_code
    assert_equal        product.version, @version

  end

  def test_product_with_bad_node
    # Lets validate an error message is returned if we have a bad node type
    product = CiscoISE::Product.new(get_product_xml(@type_of_node_bad))
    assert_equal        @type_of_node_bad_msg, product.type_of_node_as_code
  end

end