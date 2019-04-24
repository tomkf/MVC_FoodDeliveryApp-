class OrderView
    def gather_input
      puts "enter the ID for the meal"
      meal_input = gets.chomp
      puts "enter the customer ID"
      customer_input = gets.chomp
      puts "enter the employee ID"
      employee_input = gets.chomp
      send_hash = {id: 1. meal: meal_input, employee: employee_input, customer: customer_input}
      return send_hash
    end
  
    def display(repo_info)
      repo_info.each_with_index do |item, index|
        puts "#{index + 1}: #{item.meal} #{item.employee} #{item.customer}"
      end
    end

def ask_id 
puts "what is your order id"
input = gets.chomp
end

        end


