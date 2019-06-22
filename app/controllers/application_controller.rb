class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters_for_sign_up, if: :devise_controller?
	before_action :configure_permitted_parameters_for_update, if: :devise_controller?


  	protected

  	def configure_permitted_parameters_for_sign_up
    	devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :phone_number])
  	end

  	def configure_permitted_parameters_for_update
    	devise_parameter_sanitizer.permit(:account_update, keys: [:name, :phone_number])
  	end


end
