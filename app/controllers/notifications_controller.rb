class NotificationsController < ApplicationController

    def index
        @notifications = current_user.passive_notifications
                                     .where.not(visitor_id: current_user.id)
                                     .where(checked: false)
        ids = @notifications.pluck(:id)
        @notifications.each do |notification|
            notification.update_attributes(checked: true)
        end
        @notifications = Notification.where(id: ids)
    end

end
