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
end
