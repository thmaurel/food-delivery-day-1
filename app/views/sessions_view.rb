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
end
