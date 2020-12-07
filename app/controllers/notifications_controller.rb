class NotificationsController < ApplicationController

    def index
        @notifications = current_user.passive_notifications
                                     .where.not(visitor_id: current_user.id)
        @notifications.where(checked: false).each do |notification|
            notification.update_attributes(checked: true)
        end
    end
    
    def destroy
        @notifications =current_user.passive_notifications.destroy_all
        redirect_to notifications_path
    end
    
end
