require_relative "../views/customers_view"
require_relative "../models/customer"

class CustomersController
  def initialize(customer_repo)
    @view = CustomersView.new
    @customer_repo = customer_repo
  end

  # Add a new customer
  def add
    # Ask the user for name (view)
    name = @view.ask("What's the name of your customer?")
    # Ask the user for address (view)
    address = @view.ask("What's the address of your customer?")
    # Create a new instance of customer (model)
    new_customer = Customer.new(name: name, address: address)
    # Add this instance to our repository (repo)
    @customer_repo.add(new_customer)
  end

  # List all the customer
  def list
    # Get all the customers (repo)
    customers = @customer_repo.all
    # Display all of them (view)
    @view.display(customers)
  end
end
