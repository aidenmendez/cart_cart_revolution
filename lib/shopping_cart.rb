class ShoppingCart
  attr_reader :name, :capacity, :products

  def initialize(name, capacity)
    @name = name
    @capacity = capacity
    @products = []
  end

  def capacity
    capacity_int = @capacity.to_i
  end

  def add_product(product)
    @products << product
  end

  def details
    details_hash = {
      name: @name,
      capacity: capacity
    }
  end

  def total_number_of_products
    quantity_total = 0
    products.each do |product|
      quantity_total += product.quantity
    end
    quantity_total
  end

  def is_full?
   total_number_of_products > capacity 
  end

  def products_by_category(category)
    filtered_products = products.find_all do |product|
      product.category == category
    end
  end

end