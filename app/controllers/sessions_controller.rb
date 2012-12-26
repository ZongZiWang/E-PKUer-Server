class SessionsController < ApplicationController
  def new
  end

  def create
	  respond_to do |format|
		  if params[:name] == nil
			  format.html { redirect_to login_url, :alert => "Missing username" }
			  format.json { render json: { error: "Missing username" } }
		  else
			  if params[:password] == nil
				  format.html { redirect_to login_url, :alert => "Missing password" }
				  format.json { render json: { error: "Missing password" } }
			  else
				  if user = User.authenticate(params[:name], params[:password])
					  session[:user_id] = user.id
					  format.html { redirect_to admin_url }
					  format.json { render json: 0 }
				  else
					  format.html { redirect_to login_url, :alert => "Invalid user/password combination" }
					  format.json { render json: { error: "Invalid user/password combination" } }
				  end
			  end
		  end
	  end
  end

  def destroy
	  respond_to do |format|
#		  if session[:user_id] != nil
			  session[:user_id] = nil
			  format.html { redirect_to restaurants_url, :notice => "Logged out" }
			  format.json { render json: 0 }
#		  else
#			  format.html { redirect_to restaurants_url, :alert => "Not logged in" }
#			  format.json { render json: { error: "Not logged in" } }
#		  end
	  end
  end
end
