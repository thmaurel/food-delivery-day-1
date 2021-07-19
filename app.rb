# TODO: require relevant files to bootstrap the app.
# Then you can test your program with:
#   ruby app.rb
require_relative "router"
require_relative "app/repositories/meal_repository"
require_relative "app/controllers/meals_controller"


meal_repo = MealRepository.new("data/meals.csv")
meals_controller = MealsController.new(meal_repo)

router = Router.new(meals_controller)
router.run
