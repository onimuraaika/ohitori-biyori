class ApplicationController < ActionController::Base
  
    before_action :configure_permitted_parameters, if: :devise_controller?

    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :living_alone_month])
        devise_parameter_sanitizer.permit(:sign_in, keys: [:nickname])
    end
  
end
