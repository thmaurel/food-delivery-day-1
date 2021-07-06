class Meal
  #attributes reader/writer/accessor
  attr_reader :id, :name, :price
  attr_writer :id

  def initialize(attributes = {})
    @id = attributes[:id]
    @name = attributes[:name]
    @price = attributes[:price]
  end
end
