class Meal
  attr_reader :name, :price, :id
  attr_writer :price, :id
  def initialize(attr = {})
    @name = attr[:name]
    @price = attr[:price]
    @id = attr[:id]
  end
end