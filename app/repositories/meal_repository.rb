require 'csv'

class MealRepository
  def initialize(csv_file_path)
    @csv_file_path = csv_file_path
    @meals = []
    load_CSV if File.exist?(csv_file_path)
end

  def all
    return @meals
      end

  def add(view_meal)
    if @meals.empty?
      view_meal.id = 1
    else
      view_meal.id = @meals.length + 1
      end
    @meals.push(view_meal)
    write_csv
  end

  def find(id)
    found_instace = false
    @meals.each do |item|
      found_instace = item if item.id == id
    end
    return found_instace
 end

  def write_csv
    CSV.open(@csv_file_path, "w") do |csv|
      csv << ["name", "price", "id"]
      @meals.each do |item|
        csv << [item.name, item.price, item.id]
      end
    end
  end

  def load_CSV
    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_file_path, csv_options) do |row|
      row[:price] = row[:price].to_i
      row[:id] = row[:id].to_i
      @meals.push(Meal.new(name: row[:name], price: row[:price], id: row[:id]))
    end
   end
end

