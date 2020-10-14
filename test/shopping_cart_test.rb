require 'minitest/autorun'
require 'minitest/pride'
require './lib/product'
require './lib/shopping_cart'

class ShoppingCartTest < Minitest::Test
  def test_it_exists
    cart = ShoppingCart.new("King Soopers", "30items")

    assert_instance_of ShoppingCart, cart
  end

  def test_it_has_a_name
    cart = ShoppingCart.new("King Soopers", "30items")

    assert_equal "King Soopers", cart.name
  end

  def test_it_has_a_capacity
    cart = ShoppingCart.new("King Soopers", "30items")

    assert_equal 30, cart.capacity
  end

  def test_it_starts_with_no_products
    cart = ShoppingCart.new("King Soopers", "30items")

    assert_equal [], cart.products
  end

  def test_products_can_be_added_to_cart
    cart = ShoppingCart.new("King Soopers", "30items")
    product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
    product2 = Product.new(:meat, 'chicken', 4.50, '2')
    cart.add_product(product1)
    cart.add_product(product2)

    assert_equal [product1, product2], cart.products
  end

  def test_cart_details
    cart = ShoppingCart.new("King Soopers", "30items")
    cart.details

    assert_instance_of Hash, cart.details
    assert_equal 2, cart.details.count
  end

  def test_total_number_of_items_in_cart
    product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
    product2 = Product.new(:meat, 'chicken', 4.50, '2')
    product3 = Product.new(:paper, 'tissue paper', 1.25, '1')
    cart = ShoppingCart.new("King Soopers", "30items")
    cart.add_product(product1)
    cart.add_product(product2)
    cart.add_product(product3)

    assert_equal 13, cart.total_number_of_products
  end

  def test_cart_is_not_full
    product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
    product2 = Product.new(:meat, 'chicken', 4.50, '2')
    product3 = Product.new(:paper, 'tissue paper', 1.25, '1')
    cart = ShoppingCart.new("King Soopers", "30items")
    cart.add_product(product1)
    cart.add_product(product2)
    cart.add_product(product3)

    assert_equal false, cart.is_full?
  end

  def test_cart_is_full
    product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
    product2 = Product.new(:meat, 'chicken', 4.50, '2')
    product3 = Product.new(:paper, 'tissue paper', 1.25, '1')
    product4 = Product.new(:produce, 'apples', 0.99, '20')
    cart = ShoppingCart.new("King Soopers", "30items")
    cart.add_product(product1)
    cart.add_product(product2)
    cart.add_product(product3)
    cart.add_product(product4)

    assert cart.is_full?
  end

  def test_filter_products_by_category
    product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
    product2 = Product.new(:meat, 'chicken', 4.50, '2')
    product3 = Product.new(:paper, 'tissue paper', 1.25, '1')
    product4 = Product.new(:produce, 'apples', 0.99, '20')
    cart = ShoppingCart.new("King Soopers", "30items")
    cart.add_product(product1)
    cart.add_product(product2)
    cart.add_product(product3)
    cart.add_product(product4)

    assert_equal [product1, product3], cart.products_by_category(:paper)
  end
end