# TODO: implement the router of your app.
class Router
  def initialize(meals_controller, customers_controller, sessions_controller)
    @running = true
    @meals_controller = meals_controller
    @customers_controller = customers_controller
    @sessions_controller = sessions_controller
  end

  def run
    while @running
      puts "Welcome in the Food Delivery Application!"
      @employee = @sessions_controller.login
      while @employee
        # if employee is manager, display manager menu
        if @employee.role == "manager"
          # Display all the tasks
          display_manager_tasks
          # Ask the user which action
          action = gets.chomp.to_i
          puts `clear`
          # Route the action
          route_manager_action(action)
        # else display rider menu
        else
          display_rider_tasks
          action = gets.chomp.to_i
          puts `clear`
          route_rider_action(action)
        end
      end
    end
  end

  private

  def display_manager_tasks
    puts "What do you want to do next?"
    puts "1. Add a new meal"
    puts "2. List all the meals"
    puts "3. Add a new customer"
    puts "4. List all the customers"
    puts "5. Sign out"
    puts "6. Exit the application"
  end

  def display_rider_tasks
    puts "What do you want to do next?"
    puts "1. List my undelivered orders"
    puts "2. Mark order as delivered"
    puts "3. Sign out"
    puts "4. Exit the application"
  end

  def route_manager_action(action)
    case action
    when 1 then @meals_controller.add
    when 2 then @meals_controller.list
    when 3 then @customers_controller.add
    when 4 then @customers_controller.list
    when 5 then @employee = nil
    when 6 then stop
    end
  end

  def route_rider_action(action)
    case action
    when 1 then puts "TODO: RIDER ACTION1"
    when 2 then puts "TODO: RIDER ACTION2"
    when 3 then @employee = nil
    when 4 then stop
    end
  end

  def stop
    @running = false
    @employee = false
  end
end
