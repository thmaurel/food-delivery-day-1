require_relative '../views/sessions_view'

class SessionsController
  def initialize(employee_repository)
    @sessions_view = SessionsView.new
    @employee_repository = employee_repository
  end

  def login
    # Ask for username
    username = @sessions_view.ask_user_for('username')
    # Ask for password
    password = @sessions_view.ask_user_for('password')
    # Check if username exists && password is correct for this username
    employee = @employee_repository.find_by_username(username)
    if employee != nil && password == employee.password
      #display correct login
      # if true, open app
      @sessions_view.good_credentials(employee)
      return employee
    else
      # if false, try to login
      @sessions_view.bad_credentials
      print `clear`
      login
    end
  end
end
