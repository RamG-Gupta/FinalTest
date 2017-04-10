ActiveAdmin.register Location do



	config.filters = false
	config.batch_actions = false


    permit_params :liked_place,  :latitude, :longitude, :user_id
	index do
	  selectable_column
	  column :liked_place
	  column :latitude
	  column :longitude
	  column :user_id
	  actions
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
