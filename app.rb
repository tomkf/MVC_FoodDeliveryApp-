# TODO: require relevant files to bootstrap the app.
# Then you can test your program with:
#   ruby app.rb

# CONTROLLER paths:
######################################
require_relative './controllers/customers_controller'
require_relative './controllers/meals_controller'
require_relative './controllers/orders_controller'

# REPO paths:
####################################
require_relative './repositories/customer_repository'
require_relative './repositories/employee_repository'
require_relative './repositories/meal_repository'
require_relative './repositories/order_repository'

# VIEW paths:
######################################
require_relative './views/meal_view'
require_relative './views/customer_view'
require_relative './views/employee_view'
require_relative './views/order_view'



require_relative 'router'
require 'csv'


# CSV FILES:
###########################################
csv_customer = File.join(__dir__, './repositories/csv/customer.csv')
csv_employee = File.join(__dir__, './repositories/csv/employee.csv')
csv_meal = File.join(__dir__, './repositories/csv/meal.csv')
csv_order = File.join(__dir__, './repositories/csv/order.csv')
# REPOS
###########################################
customer_repo = CustomerRepository.new(csv_customer)
employee_repo = EmployeeRepository.new(csv_employee)
meal_repo = MealRepository.new(csv_meal)
order_repo = OrderRepository.new(csv_order)
# CONTROLLERS
###########################################
customer_controller = CustomerController.new(customer_repo)
employee_controller = EmployeeController.new(employee_repo)
meal_controller = MealsController.new(meal_repo)
order_controller = OrdersController.new(order_repo)
#############################################

controller_hash = { customer: customer_controller, employee: employee_controller, meal: meal_controller, order: order_controller }

router = Router.new(controller_hash)

# Start the app
router.run
