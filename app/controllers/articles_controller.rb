class ArticlesController < ApplicationController

    def new # 新規投稿画面
        @user = current_user # ヘッダーの部分テンプレート
        @article = Article.new
    end

    def create # 投稿処理
        @article = Article.new(article_params)
        @article.user_id = current_user.id
        if @article.save
           redirect_to article_path(@article) #投稿詳細画面へ
        else
           @user = current_user # ヘッダーの部分テンプレート
           render "new"
        end
    end

    def index # 投稿一覧画面
        @user = current_user # ヘッダーの部分テンプレート
        # ランキング表示
        @all_rankings = Article.find(Favorite.group(:article_id).order('count(article_id) desc').limit(3).pluck(:article_id))
        @genres = Genre.all
        # ジャンル検索
        if @genre = Genre.find_by(name: params[:name])
           @articles = @genre.articles.page(params[:page]).per(10)
        else
            @articles = Article.all.page(params[:page]).per(10)
        end
    end

    def show # 投稿詳細画面
        @article = Article.find(params[:id])
        @user = @article.user # ユーザー表示の部分テンプレート
        @favorite = Favorite.find_by(user_id: current_user, article_id: @article) # お気に入りボタン
        @comment = ArticleComment.new
    end

    def edit # 投稿編集画面
        @user = current_user # ヘッダーの部分テンプレート
        @article = Article.find(params[:id])
        # 他人の場合は一覧表示画面へ返す
        if @article.user == current_user
           render "edit"
        else
           redirect_to articles_path
        end
    end

    def update # 投稿内容更新
        @article = Article.find(params[:id])
        @article.user_id = current_user.id
        if @article.update(article_params)
          redirect_to article_path(@article)
        else
           render "edit"
        end
    end

    def destroy # 投稿削除
        article = Article.find(params[:id])
        article.destroy
        redirect_to articles_path
    end

    private

    def article_params # 投稿
        params.require(:article).permit(:image, :title, :genre_id, :body, :tag_list)
    end
    
end
