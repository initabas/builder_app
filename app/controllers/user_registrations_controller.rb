class UserRegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters, if: :devise_controller?
  def create
    build_resource(sign_up_params)
    # crate a new child instance depending on the given user type
    child_class = params[:user][:user_type].camelize.constantize
    resource.rolable = child_class.new(params[sign_up_params])

    # first check if child instance is valid
    # cause if so and the parent instance is valid as well
    # it's all being saved at once
    valid = resource.valid?
    valid = resource.rolable.valid? && valid

    resource_saved = resource.save
    yield resource if block_given?
    if valid && resource_saved
      if resource.active_for_authentication?
        set_flash_message :notice, :signed_up if is_flashing_format?
        sign_up(resource_name, resource)
        respond_with resource, location: after_sign_up_path_for(resource)
      else
        set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_flashing_format?
        expire_data_after_sign_in!
        respond_with resource, location: after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords resource
      respond_with resource { render :new }
    end
  end
  
  protected
  
  def configure_permitted_parameters
  	devise_parameter_sanitizer.for(:sign_up) { |u|u.permit(:name, :about, :user_type, :email, :password, :password_confirmation) }
  end
  
  def sign_up_params
    devise_parameter_sanitizer.sanitize(:sign_up) { |u|u.permit(:name, :about, :user_type, :email, :password, :password_confirmation) }
  end
end
