require_relative '../models/employee'
require_relative 'base_repository'

class EmployeeRepository < BaseRepository
  def initialize(csv_file)
    @csv_file = csv_file
    @elements = []
    load_csv
  end

  def find_by_username(username)
    @elements.find{|employee| employee.username == username}
  end

  private

  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_file, csv_options) do |row|
      row[:id] = row[:id].to_i
      @elements << Employee.new(row)
    end
  end
end
