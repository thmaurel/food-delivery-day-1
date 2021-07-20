require_relative '../views/sessions_view'

class SessionsController
  def initialize(employee_repo)
    @employee_repo = employee_repo
    @view = SessionsView.new
  end

  def login
    # Ask user for username (view)
    username = @view.ask("Username ?")
    # Ask user for password (view)
    password = @view.ask("Password ?")
    # Find if there is an employee with this username (repo)
    employee = @employee_repo.find_by_username(username)
    # if yes, Check if the password is correct
    puts `clear`
    if employee && employee.password == password
      @view.success(employee)
      return employee
    else
      @view.wrong_credentials
      login
    end
    # if everything is good, we want to display the menu
    # if not, display an error message and retry the login
  end
end
