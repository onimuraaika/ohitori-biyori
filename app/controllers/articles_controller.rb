class ArticlesController < ApplicationController

    def new #新規投稿画面
        @article = Article.new
    end

    def create #投稿処理
        @article = Article.new(article_params)
        @article.user_id = current_user.id
        if @article.save
          redirect_to article_path(@article) #投稿詳細画面へ
        else
           render "new"
        end
    end

    def index #投稿一覧画面
        @genres = Genre.all
        # ジャンル検索
        if @genre = Genre.find_by(name: params[:name])
           @articles = @genre.articles.page(params[:page]).per(10)
        else
            @articles = Article.all.page(params[:page]).per(10)
        end
    end

    def show #投稿詳細画面
        @article = Article.find(params[:id])
        @user = @article.user # 部分テンプレート用
        @comment = ArticleComment.new
    end

    def edit#投稿編集画面
    end

    def update#投稿内容更新
    end

    def destroy#投稿削除
    end

    private

    def article_params
        params.require(:article).permit(:image, :title, :genre_id, :body)
    end

end
