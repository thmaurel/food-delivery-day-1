require_relative "../views/orders_view"

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

  def list_all_undelivered
    # Get all undelivered orders (repo)
    orders = @order_repository.list_undelivered_orders
    # Display them (view)
    @view.display(orders)
  end

  def list_my_undelivered(me)
    # Get all my undelivered orders (repo)
    # orders = @order_repository.list_my_undelivered_orders(me)
    # Display them (view)
    # @view.display(orders)
    display_orders(me)
  end

  def mark_as_delivered(me)
    # Display the rider orders
    orders = display_orders(me)
    # Ask for the index
    index = @view.ask("Which index?").to_i - 1
    # Mark this order as delivered
    orders[index].deliver!
    # Save it in csv
    @order_repository.save_csv
  end

  def create_order
    meal = select_meal
    customer = select_customer
    employee = select_employee
    order = Order.new(meal: meal, customer: customer, employee: employee)
    @order_repository.create(order)
  end

  private

  def display_orders(me)
    orders = @order_repository.list_my_undelivered_orders(me)
    @view.display(orders)
    return orders
  end

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
