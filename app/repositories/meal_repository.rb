require 'csv'
require_relative '../models/meal'

class MealRepository
  def initialize(meals_csv_file)
    @meals_csv_file = meals_csv_file
    @meals = [] # Array that holds instances of Meal class
    @next_id = 1
    load_csv if File.exist?(@meals_csv_file)
  end

  # meal = Meal.new({name: user_given_name, price: user_given_price})
  def create(meal)
    meal.id = @next_id
    @meals << meal
    save_csv
    @next_id += 1
  end

  def all
    return @meals
  end

  def find(id)
    @meals.find { |meal| meal.id == id } # returns an instance of Meal form the @meals array for which this is true
  end

  def save_csv
    CSV.open(@meals_csv_file, 'wb') do |csv|

      csv << ['id', 'name', 'price']
      # For each meal in our @meals array, we need to write its info in our csv file
      @meals.each do |meal|
        csv << [meal.id, meal.name, meal.price]
      end
    end
  end

  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol }

    CSV.foreach(@meals_csv_file, csv_options) do |row|
      @meals << Meal.new({ id: row[:id].to_i, name: row[:name], price: row[:price].to_i })

      # This below 👇 is the same thing as the line above 👆:
      # row[:id] = row[:id].to_i
      # row[:price] = row[:price].to_i
      # @meals << Meal.new(row)
    end
    @next_id = @meals.empty? ? 1 : @meals.last.id + 1
  end
end

# meals_csv = File.join(__dir__, "../../data/meals.csv")
# meal_repo = MealRepository.new(meals_csv)

# meal_repo.create(Meal.new({name: "Spaghetti Carbonara", price: 12}))

# p meal_repo.all
