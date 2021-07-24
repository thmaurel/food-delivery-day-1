require_relative '../views/customers_view'

class CustomersController
  def initialize(customer_repository)
    @customer_repository = customer_repository
    @customers_view = CustomersView.new
  end

  def list
    # 1. Get all the meals
    # @customer_repository = CustomerRepository.new(customers_csv) from app.rb
    all_customers = @customer_repository.all

    # 2. Give the customers to a CustomersView instance method to display them
    @customers_view.display(all_customers)
  end

  def add
    # 1. Ask user for name and get it
    given_name = @customers_view.ask_for('name')

    # 2. Ask user for address and get it
    given_address = @customers_view.ask_for('address')

    # 3. Create a new Customer instance and send it to repo to add to @customers and save to csv
    new_customer = Customer.new({name: given_name, address: given_address})
    @customer_repository.create(new_customer)
  end
end
