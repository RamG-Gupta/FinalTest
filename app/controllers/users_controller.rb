class UsersController < ApplicationController
    def index
        @user = User.all
        render json: {:user => @user} 
    end
    def new
    
        @user = User.new

    end

    def show_details


        user= User.find_by(id: params[:home][:user_id])
        render json: {:home => user.as_json(only:[:id, :user_role, :first_name, :last_name, :email, :dob, :address, :country, :state, :zip_code, :kids, :created_at, :image]), responsecode: 200, responsemessage:"Successfully"}

    end

    def home

        user= User.find_by(id: params[:home][:user_id])
        #@events = @user.events.all

        #render json: {responseco: 200, responsemessage: "Successfully", home: @user}

        if user.user_role == 'king'
        	differ = User.where.not(user_role:'king')
        	#differ.as_json(only:[:id, :first_name, :user_role])
        end

        if user.user_role == 'queen'
          differ = User.where(user_role: 'girl')
        end

        if user.user_role == 'boy'
           differ = User.where(user_role:'king')
        end 

        if user.user_role == 'girl'                                                                                                                                                
        	differ = User.where(user_role: 'boy')
        end
        render json: { home: differ.as_json(only:[:id, :first_name, :user_role, :image]), responsecode: 200, responsemessage:"Successfully",}
    end
    	
    def create
	    user = User.new(user_params)
	    if user.save
		   # session[:user_id] = user.id
           #redirect_to users_url
		   render json: {:user_id => user[:id], :user_role => user[:user_role], responsecode: 200, responsemessage: "Successfull Sign in"}
	    else
		   render json: { responsecode: 400, responsemessage: "Bad Request"}
        end
    end

    def update_details

    	user = User.where(id: params[:home][:user_id])
    	if user.blank?
			return render json: {responsecode: 401,  responsemessage: "user not found"}
		end
		if user.update(update_params)
			render json: {responsecode: 200, responsemessage: "Updated Successfully"}
		else
			render json: {responsecode: 400, responsemessage: " Not updated"}
		end

    end
     	
    private 

    def user_params
    	params.require(:user).permit(:email, :password, :password_confirmation, :user_role)
    end
     
    def update_params
    	params.require(:home).permit(:id, :first_name, :last_name, :email, :dob, :address, :country, :state, :zip_code, :kids, :created_at, :image )
    end

    def home_params

       params.require(:home).permit(:user_id,:user_role)

    end

end




















