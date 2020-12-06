class ArticlesController < ApplicationController

    def new # 新規投稿
        @user = current_user # ヘッダー
        @article = Article.new
    end

    def create # 投稿処理
        @article = Article.new(article_params)
        @article.user_id = current_user.id
        if  @article.save
            redirect_to article_path(@article)
        else
            @user = current_user # ヘッダー
            render "new"
        end
    end

    def index # 投稿一覧
        @user = current_user # ヘッダー
        user_ids = User.where(is_deleted: false).pluck("id") # 退会済は非表示
        @genres = Genre.all
        # 人気投稿
        @all_rankings = Article.find(Favorite.where(user_id: user_ids)
                               .group(:article_id)
                               .order('count(article_id) desc')
                               .limit(3)
                               .pluck(:article_id))
        # おすすめ投稿
        @random_article = Article.where(user_id: user_ids)
                                 .order("RANDOM()")
                                 .limit(3)
        # ジャンル検索
        if    @genre = Genre.find_by(name: params[:name])
              @articles = @genre.articles
                                .where(user_id: user_ids)
                                .page(params[:page])
                                .per(10)
                                .order("id DESC")
        # タグ検索表示
        elsif @tag = params[:tag_name]
              @articles = Article.where(user_id: user_ids)
                                 .tagged_with("#{params[:tag_name]}")
                                 .page(params[:page])
                                 .per(10)
                                 .order("id DESC")
        # フリーワード検索
        elsif params.has_key?(:search)
              @articles = Article.search(params[:search])
                                 .where(user_id: user_ids)
                                 .page(params[:page])
                                 .per(10)
                                 .order("id DESC")
              @keyword = params[:search]
        else
              @articles = Article.where(user_id: user_ids)
                                 .page(params[:page])
                                 .per(10)
                                 .order("id DESC")
        end
    end

    def show # 投稿詳細
        @article = Article.find(params[:id])
        @user = @article.user # ユーザー表示
        @favorite = Favorite.find_by(user_id: current_user, article_id: @article)
        @comment = ArticleComment.new
        @comments = @article.article_comments.order(created_at: :desc)
    end

    def edit # 投稿編集
        @user = current_user # ヘッダー
        @article = Article.find(params[:id])
        if  @article.user == current_user
            render "edit"
        else
            redirect_to articles_path
        end
    end

    def update # 投稿更新
        @article = Article.find(params[:id])
        @article.user_id = current_user.id
        if  @article.update(article_params)
            redirect_to article_path(@article)
        else
            @user = current_user
            render "edit"
        end
    end

    def destroy # 投稿削除
        article = Article.find(params[:id])
        article.destroy
        redirect_to articles_path
    end

    private

    def article_params
        params.require(:article).permit(:image, :title, :genre_id, :body, :tag_list)
    end

end
