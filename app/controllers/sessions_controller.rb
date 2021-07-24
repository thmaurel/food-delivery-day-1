require_relative '../views/sessions_view'

class SessionsController
  def initialize(employee_repository)
    @view = SessionsView.new
    @employee_repository = employee_repository
  end

  def login
    # Ask for username (view)
    username = @view.ask("What's your username?")
    # Ask for password (view)
    password = @view.ask("What's your password?")
    # Check if the user exists and if the password is correct (repo)
    employee = @employee_repository.find_by_username(username)
    if employee && employee.password == password
      @view.successfull_login
      return employee
    else
      @view.bad_credentials
      login
    end
  end
end
