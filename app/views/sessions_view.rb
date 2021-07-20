class SessionsView
  def ask(question)
    puts question
    gets.chomp
  end

  def success(employee)
    puts "Successfully signed in. Welcome #{employee.username}!"
  end

  def wrong_credentials
    puts "Wrong credentials.. Try again!"
  end

  def display(employees)
    employees.each_with_index do |employee,index|
      puts "#{index + 1}: #{employee.username} (#{employee.role})"
    end
  end
end
