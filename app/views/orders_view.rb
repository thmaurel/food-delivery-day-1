class OrdersView
  def display(undelivered_orders)
    undelivered_orders.each_with_index do |order, index|
      puts "#{index + 1}- Meal: #{order.meal.name}. Customer: #{order.customer.name}. Employee: #{order.employee.username}"
    end
  end

  def ask_user_for(something)
    puts "What's the #{something}?"
    return gets.chomp
  end
end
