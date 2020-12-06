class ApplicationController < ActionController::Base

    before_action :configure_permitted_parameters, if: :devise_controller?
    before_action :authenticate_user!, except: [:top, :about]

    def after_sign_in_path_for(resource)
        articles_path
    end

    def after_sign_out_path_for(resource)
        root_path
    end

    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :email, :living_alone_month])
        devise_parameter_sanitizer.permit(:sign_in, keys: [:nickname])
    end


end
