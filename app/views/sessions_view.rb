class SessionsView
  def ask(question)
    puts question
    return gets.chomp
  end

  def successfull_login
    puts "You successfully logged in!"
  end

  def bad_credentials
    puts "Wrong credentials.. Try again!"
  end

  def display(employees)
    employees.each_with_index do |employee, index|
      puts "#{index + 1}. #{employee.username} - #{employee.role}"
    end
  end
end
