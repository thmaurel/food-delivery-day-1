require 'csv'
require_relative '../models/meal'

class MealRepository
  def initialize(csv_file)
    @csv_file = csv_file
    @meals = []
    @next_id = 1
    load_csv
  end

  def add(new_meal)
    new_meal.id = @next_id
    @next_id += 1
    @meals << new_meal
    store_csv
  end

  def all
    @meals
  end

  private

  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_file, csv_options) do |row|
      row[:id] = row[:id].to_i
      row[:price] = row[:price].to_i
      @meals << Meal.new(row)
    end
    @next_id = @meals.empty? ? 1 : @meals.last.id + 1
  end

  def store_csv
    CSV.open(@csv_file, "wb") do |csv|
      csv << ['id', 'name', 'price']
      @meals.each{|meal| csv << [meal.id, meal.name, meal.price]}
    end
  end
end
