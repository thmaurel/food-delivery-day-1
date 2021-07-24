class Router
  def initialize(meals_controller, customers_controller, sessions_controller, orders_controller)
    @meals_controller = meals_controller
    @customers_controller = customers_controller
    @sessions_controller = sessions_controller
    @orders_controller = orders_controller
    @running    = true
  end

  def run
    puts "Welcome to the Cookbook!"
    puts "           --           "
    while @running
      @employee = @sessions_controller.login
      while @employee
        if @employee.role == "manager"
          display_manager_tasks
          action = gets.chomp.to_i
          print `clear`
          route_manager_action(action)
        else
          display_rider_tasks
          action = gets.chomp.to_i
          print `clear`
          route_rider_action(action)
        end
      end
    end
  end

  private

  def route_manager_action(action)
    case action
    when 1 then @meals_controller.list
    when 2 then @meals_controller.add
    when 3 then @customers_controller.list
    when 4 then @customers_controller.add
    when 5 then puts "TODO: Add a new order"
    when 6 then @orders_controller.list_undelivered_orders
    when 7 then sign_out
    when 8 then stop
    else
      puts "Please press 1, 2, 3, 4 or 5"
    end
  end

  def route_rider_action(action)
    case action
    when 1 then @orders_controller.mark_as_delivered(@employee)
    when 2 then @orders_controller.list_my_orders(@employee)
    when 3 then sign_out
    when 4 then stop
    end
  end

  def sign_out
    @employee = nil
  end

  def stop
    @employee = nil
    @running = false
  end

  def display_manager_tasks
    puts ""
    puts "What do you want to do next?"
    puts "1 - List all meals"
    puts "2 - Create a new meal"
    puts "3 - List all customers"
    puts "4 - Create a new customer"
    puts "5 - Add a new order"
    puts "6 - List all undelivered orders"
    puts "7 - Sign out"
    puts "8 - Stop and exit the program"
  end

  def display_rider_tasks
    puts ""
    puts "What do you want to do next?"
    puts "1 - Mark order as delivered"
    puts "2 - List my undelivered orders"
    puts "3 - Sign out"
    puts "4 - Stop and exit the program"
  end
end
