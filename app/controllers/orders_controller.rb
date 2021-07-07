require_relative '../views/orders_view'

class OrdersController
  def initialize(order_repository, meal_repository, customer_repository, employee_repository)
    @order_repository = order_repository
    @meal_repository = meal_repository
    @customer_repository = customer_repository
    @employee_repository = employee_repository
    @meals_view = MealsView.new
    @customers_view = CustomersView.new
    @sessions_view = SessionsView.new
    @view = OrdersView.new
  end

  def list_undelivered_orders
    # Get all the undelivered orders (repo)
    undelivered_orders = @order_repository.get_undelivered_orders
    # Display them (view)
    @view.display(undelivered_orders)
  end

  def list_my_undelivered_orders(employee)
    # Get my undelivered orders (repo)
    my_undelivered_orders = @order_repository.get_my_undelivered_orders(employee)
    # Display them (view)
    @view.display(my_undelivered_orders)
  end

  def mark_as_delivered(employee)
    list_my_undelivered_orders(employee)
    index = @view.ask_user_for("order").to_i - 1
    my_orders = @order_repository.get_my_undelivered_orders(employee)
    order = my_orders[index]
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
    index = @view.ask_user_for("meal").to_i - 1
    return meals[index]
  end

  def select_customer
    customers = @customer_repository.all
    @customers_view.display(customers)
    index = @view.ask_user_for("customer").to_i - 1
    return customers[index]
  end

  def select_employee
    employees = @employee_repository.all
    @sessions_view.display(employees)
    index = @view.ask_user_for("employee").to_i - 1
    return employees[index]
  end
end
