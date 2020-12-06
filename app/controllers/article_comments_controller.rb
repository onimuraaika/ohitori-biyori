class ArticleCommentsController < ApplicationController

    def create # コメント投稿
        @article = Article.find(params[:article_id])
        article_comment = ArticleComment.new(article_comment_params)
        article_comment.article_id = @article.id
        article_comment.user_id = current_user.id
        article_comment.save
        @article.create_notification_comment(current_user, article_comment.id)
        unless article_comment.save
    		   render 'articles/show'
    	end
    end

    def destroy # コメント削除
        @article = Article.find(params[:article_id])
        article_comment = @article.article_comments.find(params[:id])
    	article_comment.destroy
    end

    private

    def article_comment_params
        params.require(:article_comment).permit(:comment)
    end

end
