class LocationsController < ApplicationController
	

def index
 location = Location.all
 render json: {location: location}

end

def create
	user = User.where(id: params[:location][:user_id]).first
    return render json: {response: 500, msg: "user not found"} if user.blank?

    location = user.locations.new(location_params)

	if location.save
		render json: {:user_id => user[:id], :location_id => location[:id], responsecode: 200, responsemessage: "Successfully submited"}
    else
    	render json: { responsecode: 400, responsemessage: "Bad Request"}
    end
end
def show
	location = Location.where(id: params[:location][:user_id])
    return render json: {staus: 500,message: "user not found"} if location.blank?

    #location = Location.find_by(id: params[:location][:user_id])
    location = Location.where(id: params[:user_id])
    #location.to_json

    render json: { responsecode: 200, responsemessage: "Successfully", location: location}
end
private
def location_params
	params.require(:location).permit(:user_id,:liked_place)
end

end
