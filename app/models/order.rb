class Order
  attr_reader :meal, :customer, :employee
  attr_accessor :id
  def initialize(attributes = {})
    @id = attributes[:id] # Integer
    @meal = attributes[:meal] # Instance of meal
    @customer = attributes[:customer] # Instance of customer
    @employee = attributes[:employee] # Instance of employee
    @delivered = attributes[:delivered] || false # Boolean
  end

  def delivered?
    @delivered
  end

  def deliver!
    @delivered = true
  end
end
