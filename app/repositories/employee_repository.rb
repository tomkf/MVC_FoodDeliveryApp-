class EmployeeRepository
  def initialize(csv_file_path)
    @csv_file_path = csv_file_path
    @employees = []
    load_CSV if File.exist?(csv_file_path)
  end

  def all_delivery_guys
    delivery_array = []

    @employees.each do |item|
      delivery_array.push(item) if item.role == "delivery_guy"
    end
    return delivery_array
    end

  def find(id)
    found_instace = false
    @employees.each do |item|
      found_instace = item if item.id == id
    end
    return found_instace
   end

  def find_by_username(username)
    @employees.each do |item|
      return item if item.username == username
    end
  end

  def load_CSV
    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_file_path, csv_options) do |row|
      @employees.push(Employee.new(name: row[:name], id: row[:id].to_i, username: row[:username], password: row[:password], role: row[:role]))
    end
  end
end



