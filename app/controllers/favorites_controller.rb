class FavoritesController < ApplicationController

    def create # お気に入り登録
        @article = Article.find(params[:article_id])
        @favorite = @article.favorites.new(user_id: current_user.id)
        @favorite.save
        @article.create_notification_favorite(current_user)
        # redirect_to request.referer
    end

    def destroy # お気に入り解除
        @article = Article.find(params[:article_id])
        @favorite = @article.favorites.find_by(user_id: current_user)
        @favorite.destroy
        # redirect_to request.referer
    end

    def index # お気に入り投稿一覧画面
        @user = current_user # ユーザー表示の部分テンプレート
        user_ids = User.where(is_deleted: false).pluck("id") # 退会済は非表示
        @articles = @user.favorite_articles.where(user_id: user_ids).page(params[:page]).per(5)
    end

end
