require_relative '../views/orders_view'
require_relative '../views/meals_view'
require_relative '../views/customers_view'
require_relative '../views/sessions_view'

class OrdersController
  def initialize(order_repository, meal_repository, customer_repository, employee_repository)
    @order_repository = order_repository
    @meal_repository = meal_repository
    @customer_repository = customer_repository
    @employee_repository = employee_repository
    @view = OrdersView.new
    @meals_view = MealsView.new
    @customers_view = CustomersView.new
    @sessions_view = SessionsView.new
  end

  def list_undelivered_orders
    # Get the undelivered orders (repo)
    orders = @order_repository.undelivered_orders
    # Display them (view)
    @view.display(orders)
  end

  def list_my_orders(current_user)
    # Get my undelivered orders (repo)
    orders = @order_repository.my_undelivered_orders(current_user)
    # Display them (view)
    @view.display(orders)
  end

  def mark_as_delivered(current_user)
    # Get my undelivered orders (repo)
    orders = @order_repository.my_undelivered_orders(current_user)
    # Display them (view)
    @view.display(orders)
    # Ask user for index (view)
    index = @view.ask("Which order did you deliver? (index)").to_i - 1
    # Get the instance from array & index
    order = orders[index]
    # Mark it as delivered (repo)
    @order_repository.mark_as_delivered(order)
  end

  def add
    meal = select_meal
    customer = select_customer
    employee = select_employee
    order = Order.new(meal: meal, customer: customer, employee: employee)
    @order_repository.create(order)
  end

  private

  def select_meal
    meals = @meal_repository.all
    @meals_view.display(meals)
    index = @view.ask("Which meal?").to_i - 1
    return meals[index]
  end

  def select_customer
    customers = @customer_repository.all
    @customers_view.display(customers)
    index = @view.ask("Which customer?").to_i - 1
    return customers[index]
  end

  def select_employee
    employees = @employee_repository.all
    @sessions_view.display(employees)
    index = @view.ask("Which employee?").to_i - 1
    return employees[index]
  end


end
