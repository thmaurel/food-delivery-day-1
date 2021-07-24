class CustomersView

  def display(customers_array)
    # For each customer in our customers_array, display their attributes
    customers_array.each do |customer|
      puts "#{customer.id}. #{customer.name}, Address: #{customer.address}"
    end
  end

  def ask_for(something)
    puts "#{something.capitalize}?"
    return gets.chomp
  end
end
