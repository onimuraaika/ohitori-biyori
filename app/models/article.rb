class Article < ApplicationRecord

    belongs_to :user
    belongs_to :genre
    has_many   :favorites,        dependent: :destroy
    has_many   :article_comments, dependent: :destroy
    has_many   :notifications,    dependent: :destroy

    validates :image, presence: true
    validates :title, presence: true, length: { maximum: 20 }
    validates :body,  presence: true
    
    attachment :image
    acts_as_taggable_on :tags

    # キーワード検索
  	def self.search(article)
        Article.where(["title LIKE ? OR body LIKE ?", "%#{article}%", "%#{article}%"])
    end
    
    # お気に入り登録確認
    def favorited_by?(user)
	      favorites.where(user_id: user.id).exists?
  	end
    
    # お気に入り登録通知
    def create_notification_favorite(current_user)
        # お気に入り登録確認
        temp = Notification.where([
               "visitor_id = ? and visited_id = ? and article_id = ? and action = ? ",
               current_user.id,
               user_id, id,
               'fvorite'
               ])
        # お気に入り未登録時のみ通知
        if temp.blank?
           notification = current_user.active_notifications.new(
                          article_id: id,
                          visited_id: user_id,
                          action: 'favorite'
                          )
           notification.save if notification.valid?
        end
    end
    
    # コメント通知
    def create_notification_comment(current_user, article_comment_id)
        # 全員に通知
        temp_ids = ArticleComment.select(:user_id).where(article_id: id).where.not(user_id: current_user.id).distinct
        temp_ids.each do |temp_id|
            save_notification_comment(current_user, article_comment_id, temp_id['user_id'])
        end
        # 初コメント、投稿者に通知
        save_notification_comment(current_user, article_comment_id, user_id) if temp_ids.blank?
    end
    
    def save_notification_comment(current_user, article_comment_id, visited_id)
        # 複数回通知
        notification = current_user.active_notifications.new(
                       article_id: id,
                       article_comment_id: article_comment_id,
                       visited_id: visited_id,
                       action: 'comment'
                       )
        # 自分の投稿・自分のコメント非通知
        if notification.visitor_id == notification.visited_id
           notification.checked = true
        end
        notification.save if notification.valid?
    end

end
