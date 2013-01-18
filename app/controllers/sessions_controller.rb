class SessionsController < ApplicationController
  skip_before_filter :authorize
  def new
  end

  def create
	  respond_to do |format|
		  if params[:name] == nil
			  format.html { redirect_to users_login_url, :alert => "Missing username" }
			  format.json { render json: { error: "Missing username" }, status: :unprocessable_entity }
		  else
			  if params[:password] == nil
				  format.html { redirect_to users_login_url, :alert => "Missing password" }
				  format.json { render json: { error: "Missing password" }, status: :unprocessable_entity }
			  else
				  if user = User.authenticate(params[:name], params[:password])
					  session[:user_id] = user.id
					  format.html { redirect_to restaurants_url }
					  format.json { render json: user.to_json(only: [ :id, :name ]) }
				  else
					  format.html { redirect_to users_login_url, :alert => "Invalid user/password combination" }
					  format.json { render json: { error: "Invalid user/password combination" }, status: :unprocessable_entity }
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
			  format.json { head :no_content }
#		  else
#			  format.html { redirect_to restaurants_url, :alert => "Not logged in" }
#			  format.json { render json: { error: "Not logged in" } }
#		  end
	  end
  end
end
