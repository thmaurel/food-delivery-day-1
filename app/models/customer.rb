class Customer
  #attributes reader/writer/accessor
  attr_reader :id, :name, :address
  attr_writer :id

  def initialize(attributes = {})
    @id = attributes[:id]
    @name = attributes[:name]
    @address = attributes[:address]
  end
end
