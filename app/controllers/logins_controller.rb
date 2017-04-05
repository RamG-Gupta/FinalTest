class LoginsController < ApplicationController
	def create
	
	user = User.find_by(email: params[:email])
	if user && user.authenticate(params[:password])
		#session[:user_id] = user.id
		render json: {:user_id => user[:id],:userRole => user[:user_role], responsecode: 200, responsemessage: "Successfully loged in"}
	else
		flash.now.alert = "email or password is invalid"
		render json: {responsecode: 400, responsemessage: "Bad Request"}
	end
end
end
