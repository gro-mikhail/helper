class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters_sign_up_for_customers, if: :devise_controller?
	before_action :configure_permitted_parameters_update_for_customers, if: :devise_controller?
	before_action :configure_permitted_parameters_sign_up_for_workers, if: :devise_controller?
	before_action :configure_permitted_parameters_update_for_workers, if: :devise_controller?


  protected

  def configure_permitted_parameters_sign_up_for_customers
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :phone_number])
  end

  def configure_permitted_parameters_update_for_customers
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :phone_number])
  end

  def configure_permitted_parameters_sign_up_for_workers
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :phone_number, :about])
  end

  def configure_permitted_parameters_update_for_workers
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :phone_number, :about])
  end

  def after_sign_in_path_for(resource)
  stored_location_for(resource) ||
    if resource.is_a?(Customer)
      customer_url(id: resource.id)
    else
      super
    end
end



end
