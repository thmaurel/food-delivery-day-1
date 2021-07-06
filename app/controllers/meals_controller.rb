require_relative '../views/meals_view'
require_relative '../models/meal'

class MealsController
  def initialize(meal_repository)
    @meal_repository = meal_repository
    @view = MealsView.new
  end

  def list
    # Get all the meals (repository)
    meals = @meal_repository.all
    # Display all the meals (view)
    @view.display(meals)
  end

  def add
    # Ask user for name & price (view)
    name = @view.ask_user_for('name')
    price = @view.ask_user_for('price').to_i
    # Create the instance of Meal
    meal = Meal.new(name: name, price: price)
    # Add it to the repo
    @meal_repository.add(meal)
  end
end
