class OrdersView
  def display(orders)
    orders.each_with_index do |order, index|
      puts "#{index + 1}. Meal: #{order.meal.name}. Customer: #{order.customer.name}. Employee: #{order.employee.username}"
    end
  end

  def ask(question)
    puts question
    gets.chomp
  end
end
