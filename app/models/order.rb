class Order
  attr_reader :id, :meal, :customer, :employee
  def initialize(attributes = {})
    @id = attributes[:id] # Integer
    @meal = attributes[:meal] # Instance of Meal
    @customer = attributes[:customer] # Instance of Customer
    @employee = attributes[:employee] # Instance of Employee
    @delivered = attributes[:delivered] || false # Boolean
  end

  def delivered?
    @delivered
  end
end
