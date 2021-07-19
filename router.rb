# TODO: implement the router of your app.
class Router
  def initialize(meals_controller)
    @running = true
    @meals_controller = meals_controller
  end

  def run
    puts "Welcome in the Food Delivery Application!"
    while @running
      # Display all the tasks
      display_tasks
      # Ask the user which action
      action = gets.chomp.to_i
      puts `clear`
      # Route the action
      route_action(action)
    end
  end

  private

  def display_tasks
    puts "What do you want to do next?"
    puts "1. Add a new meal"
    puts "2. List all the meals"
    puts "3. Add a new customer"
    puts "4. List all the customers"
    puts "5. Exit the application"
  end

  def route_action(action)
    case action
    when 1 then @meals_controller.add
    when 2 then @meals_controller.list
    when 3 then puts "TODO: add a new customer"
    when 4 then puts "TODO: list all customers"
    when 5 then @running = false
    end
  end
end
