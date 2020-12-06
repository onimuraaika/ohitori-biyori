class NotificationsController < ApplicationController

    def index
        @notifications = current_user.passive_notifications
                                            .where.not(visitor_id: current_user.id)
                                            .where(checked: false)
                                            .page(params[:page]).per(10)

        @notifications.each do |notification|
            notification.update_attributes(checked: true)
        end
        @notifications.each do |notification|
            notification.assign_attributes(checked: false)
        end
    end

end
