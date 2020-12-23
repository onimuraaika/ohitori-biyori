class UsersController < ApplicationController

    before_action :ensure_correct_user, only: [:edit, :update, :unsubscribe]

    def show # マイページ(ユーザー詳細)
        @user     = User.find(params[:id])
        @articles = @user.articles.page(params[:page]).reverse_order
    end

    def edit # 会員情報編集
        @user = current_user
        if  @user == current_user
            render "edit"
        else
            redirect_to articles_path
        end
    end

    def update # 会員情報更新
        @user = current_user
        if  @user.update(user_params)
            redirect_to user_path(current_user.id)
        else
            render 'edit'
        end
    end

    def unsubscribe # 退会確認
        @user = current_user # ヘッダー
    end

    def withdraw # 退会処理
        @user = current_user
        @user.update(is_deleted: true)
        reset_session
        redirect_to root_path
    end

    private

    def user_params
        params.require(:user).permit(:profile_image, :nickname, :introduction, :living_alone_month)
    end

    def ensure_correct_user
        @user = User.find(params[:id])
        unless @user == current_user
               redirect_to user_path(current_user)
        end
    end

end
