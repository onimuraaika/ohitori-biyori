class UsersController < ApplicationController

    def show #ユーザー詳細(マイページ)
        @user = User.find(params[:id])
        @articles = @user.articles.page(params[:page]).reverse_order #ユーザーの投稿情報
    end

    def edit#会員情報編集画面
    end

    def update#会員情報更新
    end

    def unsubscribe#退会確認画面
    end

    def withdraw#退会処理
    end

end
