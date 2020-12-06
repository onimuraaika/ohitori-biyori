class RelationshipsController < ApplicationController

    def create # フォローする
        @user = User.find(params[:user_id])
        current_user.follow(params[:user_id])
        @user.create_notification_follow(current_user)
  		# redirect_to request.referer
    end

    def destroy # フォローをやめる
        @user = User.find(params[:user_id])
        current_user.unfollow(params[:user_id])
  		# redirect_to request.referer
    end

    def following # フォローしているユーザー一覧
        @user = current_user # ヘッダーの部分テンプレート
        @users = @user.following.where(is_deleted: false).page(params[:page]).per(5)
    end

    def followed
        @user = current_user # ヘッダーの部分テンプレート
        @users = @user.followers.where(is_deleted: false).page(params[:page]).per(5)
    end

end
