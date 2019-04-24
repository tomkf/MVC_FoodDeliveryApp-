require_relative '../views/customer_view'



class CustomersController
  def initialize(repo)
    @repo = repo
    @view = View.new
    end

  def list
    display_array = @repo.all
    @view.display(display_array)
  end

  def add
    user_input = @view.gather_input
    @repo.add(user_input)
  end
end