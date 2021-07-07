require 'csv'
require_relative '../models/customer'

class CustomerRepository
  def initialize(csv_file)
    @customers = []
    @csv_file = csv_file
    @next_id = 1
    load_csv if File.exist?(@csv_file)
  end

  def find(customer_id)
    @customers.find{|customer| customer.id == customer_id}
  end

  def all
    @customers
  end

  def add(customer)
    customer.id = @next_id
    @customers << customer
    @next_id += 1
    store_csv
  end

  private

  def store_csv
    CSV.open(@csv_file, 'wb') do |csv|
      csv << ['id', 'name', 'address']
      @customers.each do |customer|
        csv << [customer.id, customer.name, customer.address]
      end
    end
  end

  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_file, csv_options) do |row|
      row[:id] = row[:id].to_i
      @customers << Customer.new(row)
    end
    @next_id = @customers.last.id + 1 unless @customers.empty?
  end
end
