# # TODO: implement the router of your app.
# # {customer: customer_controller, employee: employee_controller, meal: meal_controller, order: order_controller}



# class Router
#   attr_reader :customer_controller, :employee_controller, :meal_controller, :order_controller
#   attr_writer :customer_controller, :employee_controller, :meal_controller, :order_controller

#   def initialize(controller_hash = {})
#     @customer_controller = controller_hash[:customer]
#     @employee_controller = controller_hash[:employee]
#     @meal_controller = controller_hash[:meal]
#     @order_controller = controller_hash[:order]
#     @running = true
#   end

#   def run
#     puts "Welcome to the food order app"
#     puts '           --           '
#         end

#   def stop
#     @running = false
#   end

#   def route_action; end

#   def display_tasks; end
# end




class Router
  def initialize(meals_controller, customer_controller, sessions_controller)
    @customer_controller = customer_controller
    @meals_controller = meals_controller
    @sessions_controller = sessions_controller
    @running = true
  end

  def run
    employee = @sessions_controller.login
    while @running
      if employee.manager?
        manager_options
      else
        delivery_guy_options
      end
    end
  end

  private

  def manager_actions(action)
    case action
    when 1 then @meals_controller.list
    when 2 then @meals_controller.add
    when 3 then @customer_controller.list
    when 4 then @customer_controller.add
    when 5 then stop
    else
      puts "Please press 1, 2, 3, 4 or 5"
    end
  end

  def delivery_guy_actions(action)
    case action
    when 1 then puts"TODO"
    when 2 then puts"TODO"
    when 3 then stop
    else
      puts "Please press 1, 2, or 3"
    end
  end

  def manager_options
    puts "=== MAIN MENU ==="
    puts "1 - List all meals"
    puts "2 - Add a new meal"
    puts "3 - List all customers"
    puts "4 - Add a new customer"
    puts "5 - Quit"
    print "What do you want to do? "
    action = gets.chomp.to_i
    print `clear`
    manager_actions(action)
  end

  def delivery_guy_options
    puts "=== MAIN MENU ==="
    puts "1 - My Undelivered Orders"
    puts "2 - Mark Order as Delivered"
    puts "3 - Quit"
    print "What do you want to do? "
    action = gets.chomp.to_i
    print `clear`
    delivery_guy_actions(action)
  end

  def stop
    @running = false
  end
end