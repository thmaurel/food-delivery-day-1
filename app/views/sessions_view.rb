class SessionsView
  def ask_user_for(something)
    puts "What's the #{something}?"
    return gets.chomp
  end

  def good_credentials(employee)
    puts "Hello #{employee.username}, welcome in Food Delivery!"
  end

  def bad_credentials
    puts "Wrong credentials.. Try again"
  end

  def display(employees)
    employees.each_with_index do |employee,index|
      puts "#{index + 1}: #{employee.username} (#{employee.role})"
    end
  end
end
