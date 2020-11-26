class FavoritesController < ApplicationController

    def create # お気に入り登録
        @article = Article.find(params[:article_id])
        favorite = @article.favorites.new(user_id: current_user.id)
        favorite.save
        redirect_to request.referer
    end

    def destroy # お気に入り解除
        @article = Article.find(params[:article_id])
        favorite = @article.favorites.find_by(user_id: current_user.id)
        favorite.destroy
        redirect_to request.referer
    end

    def index # お気に入り投稿一覧画面
        @user = current_user # ユーザー表示の部分テンプレート
        @articles = @user.favorite_articles.page(params[:page]).per(10)
    end

end
