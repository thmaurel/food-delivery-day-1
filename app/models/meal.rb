class Meal
  attr_accessor :id
  attr_reader :name, :price

  def initialize(attributes = {})
    # State/Attributes
    @id = attributes[:id]
    @name = attributes[:name]
    @price = attributes[:price]
  end
end


# new_meal = Meal.new({ price: 7, id: 1, name: "Pizza Haiwai"})
# p new_meal
