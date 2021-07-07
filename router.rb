# TODO: implement the router of your app.

class Router
  def initialize(meals_controller, customers_controller, sessions_controller)
    @running = true
    @meals_controller = meals_controller
    @customers_controller = customers_controller
    @sessions_controller = sessions_controller
  end

  def run
    puts "Welcome to the Food Delivery!"
    puts "           --           "
    while @running
      @employee = @sessions_controller.login
      while @employee
        if @employee.role == 'manager'
          manager_display_tasks
          action = gets.chomp.to_i
          print `clear`
          manager_route_action(action)
        else
          puts 'Rider Menu'
        end
      end
    end
  end

  private

  def manager_display_tasks
    puts ""
    puts "What do you want to do next?"
    puts "1 - List all meals"
    puts "2 - Add a new meal"
    puts "3 - List all customers"
    puts "4 - Add a new customer"
    puts "5 - Sign out"
    puts "6 - Stop and exit the program"
  end

  def manager_route_action(action)
    case action
    when 1 then @meals_controller.list
    when 2 then @meals_controller.add
    when 3 then @customers_controller.list
    when 4 then @customers_controller.add
    when 5 then sign_out
    when 6 then stop
    else
      puts "Please press 1, 2, 3, 4 or 5"
    end
  end

  def sign_out
    @employee = false
  end

  def stop
    sign_out
    @running = false
  end
end
