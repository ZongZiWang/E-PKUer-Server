class ApplicationController < ActionController::Base
#	before_filter :authorize
	protect_from_forgery

	protected
	def authorize
		unless User.find_by_id(session[:user_id])
			respond_to do |format|
				format.html { redirect_to users_login_url, :notice => "Please log in" }
				format.json { render json: { error: "NotLoggedIn" }, status: :unprocessable_entity }
			end
		end
	end

end
