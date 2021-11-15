Rails.application.routes.draw do
  	
  	resources :vehicles do
  		resources :locations
  		# get 'vehicles/:vehicle_id/locations/:id', to:'vehicles#locations'
  	end

end