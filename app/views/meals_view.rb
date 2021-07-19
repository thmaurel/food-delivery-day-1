class MealsView
  def ask(question)
    puts question
    gets.chomp
  end

  def display(meals)
    meals.each_with_index do |meal, index|
      puts "#{index + 1}. #{meal.name} - #{meal.price}$"
    end
  end
end
