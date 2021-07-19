require_relative "../views/meals_view"
require_relative "../models/meal"

class MealsController
  def initialize(meal_repo)
    @view = MealsView.new
    @meal_repo = meal_repo
  end

  # Add a new meal
  def add
    # Ask the user for name (view)
    name = @view.ask("What's the name of your meal?")
    # Ask the user for price (view)
    price = @view.ask("What's the price of your meal?").to_i
    # Create a new instance of meal (model)
    new_meal = Meal.new(name: name, price: price)
    # Add this instance to our repository (repo)
    @meal_repo.add(new_meal)
  end

  # List all the meal
  def list
    # Get all the meals (repo)
    meals = @meal_repo.all
    # Display all of them (view)
    @view.display(meals)
  end
end
