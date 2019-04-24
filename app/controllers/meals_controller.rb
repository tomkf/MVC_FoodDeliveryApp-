class MealsController
  def initialize(repository)
    @meal = repository
    @view = MealView.new
  end

  def list
    display_array = @meal.all
    @view.display_view(display_array)
  end

  def add
    user_input = @view.gather_input
    @meal.add(user_input)
  end
    end



class MealView
  def gather_input
    puts "enter a name"
    name_input = gets.chomp
    puts "enter a price for #{name_input}"
    price_input = gets.chomp.to_i
    new_instance = Meal.new(name: name_input, price: price_input)
  end

  def display_view(repo_info)
    repo_info.each_with_index do |item, index|
      puts "#{index + 1}: #{item.name}"
    end
  end
    end





