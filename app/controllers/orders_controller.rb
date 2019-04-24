class OrdersController
  def initialize(meal_repository, employee_repository, customer_repository, order_repository)
    @meal_repository = meal_repository
    @employee_repository = employee_repository
    @customer_repository = customer_repository
    @order_repository = order_repository
    @view = OrderView.new
  end

  def list_undelivered_orders
    info_for_view = @order_repository.undelivered_orders
    @view.display(info_for_view)
  end

  def add
    view_inputs = @view.gather_input
    meal = @meal_repository.find(view_inputs[:mealID])
    customer = @customer_repository.find(view_inputs[:customerID])
    employee = @employee_repository.find(view_inputs[:employeeID])
    order = Order.new(id: 1, meal: meal, customer: customer, employee: employee, delivered: false)
    @order_repository.add(order)
  end

  def list_my_orders(employee_instance)
    undelivered_array = @order_repository.undelivered_orders
    name = undelivered_array.select { |instance| instance.employee == employee_instance }
    @view.display2(name)
  end

  def mark_as_delivered(employee_instance)
    my_orders = list_my_orders(employee_instance)
    my_id = @view.ask_id
    instance = @order_repository.find(my_id)
    instance.deliver!
  end
end



class OrderView
  def ask_id
    puts "what is your order id"
    input = gets.chomp.to_i
  end

  def gather_input
    puts "enter the ID for the meal"
    meal_input = gets.chomp.to_i
    puts "enter the customer ID"
    customer_input = gets.chomp.to_i
    puts "enter the employee ID"
    employee_input = gets.chomp.to_i
    send_hash = { mealID: meal_input, customerID: customer_input, employeeID: employee_input }
    return send_hash
  end

  def display(repo_info)
    repo_info.each_with_index do |item, index|
      puts "#{index + 1}: #{item.meal.name} #{item.employee.username} #{item.customer.name}"
    end
  end

  def display2(repo_info)
    repo_info.each do |item|
      puts "#{item.customer.name} #{item.meal.name}"
    end
  end
 end

