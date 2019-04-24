require 'csv'

class OrderRepository
  attr_writer :orders
  def initialize(csv_file, meal, employee, customer)
    @csv_file = csv_file
    @meal_repository = meal
    @customer_repository = customer
    @employee_repository = employee
    @orders = []
    load_CSV if File.exist?(@csv_file)
  end

  # id,delivered,meal_id,employee_id,customer_id

  def write_csv
    CSV.open(@csv_file, "w") do |csv|
      csv << ["id", "delivered", "meal_id", "employee_id", "customer_id"]
      @orders.each do |item|
        csv << [item.id, item.delivered, item.meal.id, item.employee.id, item.customer.id]
      end
    end
  end

  def add(order) # assumes an instance///
    if @orders.empty?
      order.id = 1
    else
      order.id = @orders.length + 1
        end
    @orders.push(order)
    write_csv
   end

  def undelivered_orders
    found_instaces = []
    @orders.each do |item|
      found_instaces.push(item) if item.delivered == false
    end
    write_csv
    return found_instaces
  end

  def load_CSV
    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_file, csv_options) do |row|
      row[:delivered] = row[:delivered] == "true"
      row_hash = { id: row[:id].to_i,
                   delivered: row[:delivered],
                   meal: @meal_repository.find(row[:meal_id].to_i),
                   employee: @employee_repository.find(row[:employee_id].to_i),
                   customer: @customer_repository.find(row[:customer_id].to_i) }
      @orders.push(Order.new(row_hash))
    end
      end

  def find(input)
    found_instace = false
    @orders.each do |item|
      found_instace = item if item.id == input
    end
    return found_instace
  end
end

