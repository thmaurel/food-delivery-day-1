require_relative '../views/customers_view'
require_relative '../models/customer'

class CustomersController
  def initialize(customer_repository)
    @customer_repository = customer_repository
    @view = CustomersView.new
  end

  def list
    # Get all the customers (repository)
    customers = @customer_repository.all
    # Display all the customers (view)
    @view.display(customers)
  end

  def add
    # Ask user for name & price (view)
    name = @view.ask_user_for('name')
    address = @view.ask_user_for('address')
    # Create the instance of customer
    customer = Customer.new(name: name, address: address)
    # Add it to the repo
    @customer_repository.add(customer)
  end
end
