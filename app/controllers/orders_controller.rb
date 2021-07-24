require_relative '../views/orders_view'

class OrdersController
  def initialize(order_repository)
    @order_repository = order_repository
    @view = OrdersView.new
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
end
