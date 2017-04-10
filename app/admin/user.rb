ActiveAdmin.register User do


config.filters = false
config.batch_actions = false


permit_params :first_name, :last_name,  :email, :password, :dob, :address, :country, :state, :zip_code , :kids, :user_role, :image
	

	index do
	  selectable_column
	  column :id
	  column :first_name
	  column :last_name
	  column :email
	  column :dob
	  column :address
	  column :country
	  column :state
	  column :zip_code
	  column :kids
	  column :user_role
	  column "Image" do |user|
	  	image_tag(user.image_url,size: "100*100")
	  end

	  actions
	end
     


	form do |f|
	 	f.inputs 'Details' do
	      f.input :first_name
	      f.input :last_name
	      f.input :email
	      f.input :password
	      f.input :dob
	      f.input :address
	      f.input :country
	      f.input :state
	      f.input :zip_code
	      f.input :kids
	      f.input :user_role
	      f.input :image
	       	
	    end         
	  	f.actions        
	end

	
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

end
