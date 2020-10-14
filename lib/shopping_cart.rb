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

end