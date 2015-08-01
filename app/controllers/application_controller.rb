class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  before_action do
    if user_signed_in?
      customer = current_user.customer
      ActiveRecord::Base.connection.execute("SET ROLE #{customer.db_role}")
    end
  end

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
end
