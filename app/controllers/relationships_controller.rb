class RelationshipsController < ApplicationController

    def create # フォローする
        current_user.follow(params[:user_id])
  		redirect_to request.referer
    end

    def destroy # フォローをやめる
        current_user.unfollow(params[:user_id])
  		redirect_to request.referer
    end

    def following # フォローしているユーザー一覧
        @user = current_user
    end

end
