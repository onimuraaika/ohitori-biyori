class Article < ApplicationRecord

    attachment :image

    acts_as_taggable_on :tags

    belongs_to :user
    belongs_to :genre
    has_many :favorites, dependent: :destroy
    has_many :article_comments, dependent: :destroy
    has_many :notifications, dependent: :destroy

    validates :image, presence: true
    validates :title, presence: true, length: { maximum: 20 }
    validates :body, presence: true
    
    # キーワード検索
  	def self.search(article)
        Article.where(["title LIKE ? OR body LIKE ?", "%#{article}%", "%#{article}%"])
    end
    
     # user_idがFavoritesテーブル内に存在するか
    def favorited_by?(user)
	      favorites.where(user_id: user.id).exists?
  	end
    
    # お気に入り登録通知
    def create_notification_favorite(current_user)
        # お気に入りされているか
        temp = Notification.where(["visitor_id = ? and visited_id = ? and article_id = ? and action = ? ", current_user.id, user_id, id, 'fvorite'])
        # お気に入り未登録時のみ、通知レコードを作成
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
        # 自分以外にコメントしている人をすべて取得し、全員に通知を送る
        temp_ids = ArticleComment.select(:user_id).where(article_id: id).where.not(user_id: current_user.id).distinct
        temp_ids.each do |temp_id|
            save_notification_comment(current_user, article_comment_id, temp_id['user_id'])
        end
        # まだ誰もコメントしていない場合は、投稿者に通知を送る
        save_notification_comment(current_user, article_comment_id, user_id) if temp_ids.blank?
    end
    
    def save_notification_comment(current_user, article_comment_id, visited_id)
        # コメントは複数回することが考えられるため、１つの投稿に複数回通知する
        notification = current_user.active_notifications.new(
          article_id: id,
          article_comment_id: article_comment_id,
          visited_id: visited_id,
          action: 'comment'
        )
        # 自分の投稿に対するコメントの場合は、通知済みとする
        if notification.visitor_id == notification.visited_id
          notification.checked = true
        end
        notification.save if notification.valid?
    end

end
