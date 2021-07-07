class OrdersView
  def display(undelivered_orders)
    undelivered_orders.each do |order|
      puts "#{order.id}- Meal: #{order.meal.name}. Customer: #{order.customer.name}. Employee: #{order.employee.username}"
    end
  end
end
