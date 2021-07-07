class Order
  attr_reader :meal, :customer, :employee
  attr_accessor :id
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

  def deliver!
    @delivered = true
  end
end
