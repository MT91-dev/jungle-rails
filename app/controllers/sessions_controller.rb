class SessionsController < ApplicationController

  def new
  end

  def create
    #Find if the user exists
    user = User.find_by_email(params[:email])

    # If the user exists AND the password entered is correct.
    if user && user.authenticate(params[:password])
      # Save the user id inside the browser cookie so user stays logged in as they navigate website.
      session[:user_id] = user.id
      redirect_to '/'
    else
    # If user's login fails, redirect the user to the login form.
      redirect_to '/login'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end

end