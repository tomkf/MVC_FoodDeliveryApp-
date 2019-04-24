class Employee
  attr_reader :name, :id, :username, :password, :role
  attr_writer :role, :id
  def initialize(attr)
    @name = attr[:name]
    @id = attr[:id]
    @username = attr[:username]
    @password = attr[:password]
    @role = attr[:role]
  end

  def manager?
    @role == "manager"
  end

  def delivery_guy?
    @role == "delivery_guy"
  end
end


