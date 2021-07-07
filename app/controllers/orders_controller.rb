require_relative '../views/orders_view'

class OrdersController
  def initialize(order_repository)
    @order_repository = order_repository
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
end
