require_relative '../views/meals_view'

class MealsController
  def initialize(meal_repository)
    @meal_repository = meal_repository
    @meals_view = MealsView.new
  end

  def list
    # 1. Get all the meals
    # @meal_repository = MealRepository.new(meals_csv) from app.rb
    all_meals = @meal_repository.all

    # 2. Give the meals to a MealsView instance method to display them
    @meals_view.display(all_meals)
  end

  def add
    # 1. Ask user for name and get it
    given_name = @meals_view.ask_for_name

    # 2. Ask user for price and get it
    given_price = @meals_view.ask_for_price

    # 3. Create a new Meal instance and send it to repo to add to @meals and save to csv
    new_meal = Meal.new({name: given_name, price: given_price})
    @meal_repository.create(new_meal)
  end
end
