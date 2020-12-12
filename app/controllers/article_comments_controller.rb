class ArticleCommentsController < ApplicationController

    def create # コメント投稿
        @article           = Article.find(params[:article_id])
        comment            = ArticleComment.new(article_comment_params)
        comment.article_id = @article.id
        comment.user_id    = current_user.id
        comment.save
        @article.create_notification_comment(current_user, comment.id)
        unless comment.save
    		   render 'articles/show'
    	end
    end

    def destroy # コメント削除
        @article = Article.find(params[:article_id])
        comment  = @article.article_comments.find(params[:id])
    	comment.destroy
    end

    private

    def article_comment_params 
        params.require(:article_comment).permit(:comment)
    end

end
