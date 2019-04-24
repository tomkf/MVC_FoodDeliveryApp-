require 'csv'

class CustomerRepository
  def initialize(csv_file)
    @csv_file = csv_file
    @customers = []
    load_CSV if File.exist?(csv_file)
  end

  def load_CSV
    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_file, csv_options) do |row|
      @customers.push(Customer.new(name: row[:name], address: row[:address], id: row[:id].to_i))
    end
  end

  def all
    return @customers
      end

  def add(customer)
    if @customers.empty?
      customer.id = 1
    else
      customer.id = @customers.length + 1
      end
    @customers.push(customer)
    write_csv
  end

  def find(id)
    found_instace = false
    @customers.each do |item|
      found_instace = item if item.id == id
    end
    return found_instace
   end

  def write_csv
    CSV.open(@csv_file, "w") do |csv|
      csv << ["name", "address", "id"]
      @customers.each do |item|
        csv << [item.name, item.address, item.id]
      end
    end
   end
end

