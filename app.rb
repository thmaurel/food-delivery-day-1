require_relative './app/repositories/meal_repository'
require_relative './app/repositories/customer_repository'
require_relative './app/repositories/employee_repository'

require_relative './app/controllers/meals_controller'
require_relative './app/controllers/customers_controller'
require_relative './app/controllers/sessions_controller'

require_relative 'router'

meals_csv = File.join(__dir__, "./data/meals.csv")
customer_csv = File.join(__dir__, "./data/customers.csv")
employee_csv = File.join(__dir__, "./data/employees.csv")

meal_repo = MealRepository.new(meals_csv)
customer_repo = CustomerRepository.new(customer_csv)
employee_repo = EmployeeRepository.new(employee_csv)

meals_controller = MealsController.new(meal_repo)
customers_controller = CustomersController.new(customer_repo)
sessions_controller = SessionsController.new(employee_repo)

router = Router.new(meals_controller, customers_controller, sessions_controller)

router.run
