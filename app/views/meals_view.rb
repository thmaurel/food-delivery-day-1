class MealsView

  def display(meals_array)
    # For each meal in our meals_array, display their attributes
    meals_array.each do |meal|
      puts "#{meal.id}. #{meal.name}, Price: #{meal.price}"
    end
  end

  def ask_for_name
    puts "Name?"
    return gets.chomp
  end

  def ask_for_price
    puts "Price?"
    return gets.chomp.to_i
  end
end
