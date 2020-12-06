class RelationshipsController < ApplicationController

    def create # フォローする
        @user = User.find(params[:user_id])
        current_user.follow(params[:user_id])
        @user.create_notification_follow(current_user)
    end

    def destroy # フォローはずす
        @user = User.find(params[:user_id])
        current_user.unfollow(params[:user_id])
    end

    def following # フォローユーザー一覧
        @user = current_user # ヘッダー
        @users = @user.following
                      .where(is_deleted: false)
                      .page(params[:page]).per(5)
    end

    def followed # フォロワー一覧
        @user = current_user # ヘッダー
        @users = @user.followers.page(params[:page]).per(5)
    end

end
