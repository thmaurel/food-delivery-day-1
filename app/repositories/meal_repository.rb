require 'csv'
require_relative '../models/meal'

class MealRepository
  def initialize(csv_file)
    @meals = []
    @csv_file = csv_file
    @next_id = 1
    load_csv if File.exist?(@csv_file)
  end

  def all
    @meals
  end

  def find(meal_id)
    @meals.find{|meal| meal.id  == meal_id }
  end

  def add(meal)
    meal.id = @next_id
    @meals << meal
    @next_id += 1
    store_csv
  end

  private

  def store_csv
    CSV.open(@csv_file, 'wb') do |csv|
      csv << ['id', 'name', 'price']
      @meals.each do |meal|
        csv << [meal.id, meal.name, meal.price]
      end
    end
  end

  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_file, csv_options) do |row|
      row[:id] = row[:id].to_i
      row[:price] = row[:price].to_i
      @meals << Meal.new(row)
    end
    @next_id = @meals.last.id + 1 unless @meals.empty?
  end
end
