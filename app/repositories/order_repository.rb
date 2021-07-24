require_relative '../models/order'

class OrderRepository
  def initialize(csv_file_path, meal_repository, customer_repository, employee_repository)
    @csv_file_path = csv_file_path
    @meal_repository = meal_repository
    @customer_repository = customer_repository
    @employee_repository = employee_repository
    @orders = []
    load_csv
  end

  def undelivered_orders
    @orders.reject{|order| order.delivered?}
  end

  def my_undelivered_orders(current_user)
    @orders.select{|order| order.delivered? == false && order.employee == current_user}
  end

  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol }

    CSV.foreach(@csv_file_path, csv_options) do |row|
        row[:id] = row[:id].to_i
        row[:meal] = @meal_repository.find(row[:meal_id].to_i)
        row[:customer] = @customer_repository.find(row[:customer_id].to_i)
        row[:employee] = @employee_repository.find(row[:employee_id].to_i)
        row[:delivered] = row[:delivered] == "true"
      @orders << Order.new(row)
    end
  end
end
