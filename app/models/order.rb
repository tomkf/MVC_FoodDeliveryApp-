class Order
  attr_reader :id, :delivered, :meal, :employee, :customer
  attr_writer :id, :delivered

  def initialize(properties = {})
    @id = properties[:id]
    @meal = properties[:meal]
    @employee = properties[:employee]
    @customer = properties[:customer]
    @delivered = properties[:delivered] || false
  end

  def delivered?
    @delivered == true
end

  def deliver!
    @delivered = true
  end
end