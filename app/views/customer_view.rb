class CustomerView
  def gather_input
    puts "enter a name"
    name_input = gets.chomp
    puts "enter an address for #{name_input}"
    address_input = gets.chomp
    new_instance = Customer.new(name: name_input, address: address_input)
  end

  def display(repo_info)
    repo_info.each_with_index do |item, index|
      puts "#{index + 1}: #{item.name} #{item.address}"
    end
  end
      end