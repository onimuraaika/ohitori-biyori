class User < ApplicationRecord

    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

    devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :validatable

    # ゲストユーザー生成
    def self.guest
        find_or_create_by!(nickname: 'ゲスト', email: 'guest@user.com', living_alone_month: 1) do |user|
            user.password = SecureRandom.urlsafe_base64
        end
    end

    has_many :articles,              dependent: :destroy
    has_many :article_comments,      dependent: :destroy
    has_many :favorites,             dependent: :destroy
    has_many :favorite_articles,     through:   :favorites, source: :article

    has_many :active_notifications,  class_name: 'Notification', foreign_key: 'visitor_id', dependent: :destroy
    has_many :passive_notifications, class_name: 'Notification', foreign_key: 'visited_id', dependent: :destroy

    # フォローしている
    has_many :relationships,         class_name: "Relationship", foreign_key: "following_id", dependent: :destroy
    # フォローされている
    has_many :passive_relationships, class_name: "Relationship", foreign_key: "followed_id",  dependent: :destroy
    has_many :following,                                 through: :relationships,         source: :followed
    has_many :followers, -> { where is_deleted: false }, through: :passive_relationships, source: :following


    validates :nickname,           presence: true, length: { minimum: 2 }
    validates :living_alone_month, presence: true, numericality: true
    validates :email,              presence: true
    validates :introduction,                       length: { maximum: 100 }

    attachment :profile_image
    attachment :image

    # フォロー確認
    def followed_by?(user)
        passive_relationships.find_by(following_id: user.id).present?
    end

    # フォローする
    def follow(user_id)
        relationships.create(followed_id: user_id)
    end

    # フォローはずす
    def unfollow(user_id)
        relationships.find_by(followed_id: user_id).destroy
    end

    # 退会後ログイン拒否
    def active_for_authentication?
        super && (self.is_deleted == false)
    end
    
    # 退会後ログイン拒否のエラーメッセージ カスタマイズ
    def inactive_message
        self.is_deleted == false ? super : :is_deleted_true
    end

    # おひとり暮らし歴更新
    def self.add_living_alone_month
        users = all
        users.each do |user|
            next if user.email == 'guest@user.com'
            user.living_alone_month += 1
            user.save
        end
    end

    # フォロー通知
    def create_notification_follow(current_user)
    temp = Notification.where(["visitor_id = ? and visited_id = ? and action = ? ",current_user.id, id, 'follow'])
         if temp.blank?
            notification = current_user.active_notifications.new(
             visited_id: id,
             action: 'follow'
            )
            notification.save if notification.valid?
        end
    end

end
