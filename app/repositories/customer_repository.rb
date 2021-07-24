require 'csv'
require_relative '../models/customer'

class CustomerRepository
  def initialize(customers_csv_file)
    @customers_csv_file = customers_csv_file
    @customers = [] # Array that holds instances of customer class
    @next_id = 1
    load_csv if File.exist?(@customers_csv_file)
  end

  # customer = Customer.new({name: user_given_name, address: user_given_address})
  def create(customer)
    customer.id = @next_id
    @customers << customer
    save_csv
    @next_id += 1
  end

  def all
    return @customers
  end

  def find(id)
    @customers.find { |customer| customer.id == id } # returns an instance of Customer form the @customers array for which this is true
  end

  def save_csv
    CSV.open(@customers_csv_file, 'wb') do |csv|

      csv << ['id', 'name', 'address']
      # For each customer in our @customers array, we need to write its info in our csv file
      @customers.each do |customer|
        csv << [customer.id, customer.name, customer.address]
      end
    end
  end

  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol }

    CSV.foreach(@customers_csv_file, csv_options) do |row|
      @customers << Customer.new({ id: row[:id].to_i, name: row[:name], address: row[:address] })
    end
    @next_id = @customers.empty? ? 1 : @customers.last.id + 1
  end
end
