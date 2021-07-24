class Employee
  attr_reader :id, :username, :password, :role
  def initialize(attributes = {})
    @id = attributes[:id]
    @username = attributes[:username]
    @role = attributes[:role]
    @password = attributes[:password]
  end
end
