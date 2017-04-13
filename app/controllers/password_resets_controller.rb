class PasswordResetsController < ApplicationController
   def new

  end

def create

   user = User.find_by(email: params[:user][:email])
  if user.present?
   user.send_password_reset 
   render json:{ responsecode: 200, responsemessage: "Email send with password reset instruction." }
else 
	render json: {responsecode: 500, responsemessage: "Email not found"}
end




end
end
