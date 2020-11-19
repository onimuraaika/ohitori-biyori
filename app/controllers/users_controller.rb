class UsersController < ApplicationController

    def show #ユーザー詳細(マイページ)
        @user = User.find(params[:id])
        @articles = @user.articles.page(params[:page]).reverse_order #ユーザーの投稿情報
    end

    def edit#会員情報編集画面
        @user = User.find(params[:id])
    end

    def update#会員情報更新
        @user = User.find(params[:id])
        @user.update(user_params)
        redirect_to user_path(@user.id)
    end

    def unsubscribe#退会確認画面
    end

    def withdraw#退会処理
    end
    
    private
    
    def user_params
        params.require(:user).permit(:profile_image, :nickname, :introduction, :living_alone_month)
    end

end
