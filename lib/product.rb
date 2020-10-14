class Product
  attr_reader :category, :name, :unit_price, :quantity

  def initialize(category, name, unit_price, quantity)
    @category= category
    @name = name
    @unit_price = unit_price
    @quantity = quantity.to_i
    @hoard = false
  end

  def total_price
    total = @quantity * @unit_price
  end

  def is_hoarded?
    @hoard
  end 

  def hoard
    @hoard = true
  end
end