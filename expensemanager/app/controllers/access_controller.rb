class AccessController < ApplicationController
  def index
  end

  def login
  end
  
  def attempt_login
	  user=User.find_by_name(params[:name])
	  user_password = User.find_by_password(params[:password])
	  if user && user_password
		session[:user_id]=user.id
		session[:user_name]=user.name
		flash[:notice] = "You are now logged in."
		redirect_to(:action => 'index')
	  else
		flash[:notice] = "Invalid username/password combination."
		redirect_to(:action => 'login')
	  end 
	end
	
   def logout
    # mark user as logged out
    session[:user_id] = nil
    session[:user_name] = nil
    flash[:notice] = "Logged out"
    redirect_to(:action => "login")
  end
end