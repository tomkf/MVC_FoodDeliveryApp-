class Customer
  attr_reader :name, :address, :id
  attr_writer :id
  def initialize(attr = {})
    @id = attr[:id]
    @name = attr[:name]
    @address = attr[:address]
  end
end

