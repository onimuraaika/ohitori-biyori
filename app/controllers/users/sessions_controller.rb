class Users::SessionsController < Devise::SessionsController

    def create_guest
        user = User.guest
        sign_in user
        redirect_to articles_path
    end

end