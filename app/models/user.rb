class User < ApplicationRecord

    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

    attachment :profile_image
    attachment :image

    devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :validatable

    # ゲストユーザー生成
    def self.guest
        find_or_create_by!(nickname: 'ゲスト', email: 'guest@user.com', living_alone_month: 1) do |user|
            user.password = SecureRandom.urlsafe_base64
        end
    end

    has_many :articles, dependent: :destroy
    has_many :favorites, dependent: :destroy
    has_many :favorite_articles, through: :favorites, source: :article
    has_many :article_comments, dependent: :destroy
    # フォローしている
    has_many :relationships, class_name: "Relationship", foreign_key: "following_id", dependent: :destroy
    has_many :following, through: :relationships, source: :followed
    # フォローしてもらっている
    has_many :passive_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
    has_many :followers, through: :passive_relationships, source: :following

    validates :nickname, presence: true, length: { minimum: 2 }, uniqueness: true
    validates :living_alone_month, presence: true
    validates :email, presence: true
    validates :introduction, length: { maximum: 100 }

    # フォローしているかどうか
    def followed_by?(user)
        passive_relationships.find_by(following_id: user.id).present?
    end

    # フォローする
    def follow(user_id)
        relationships.create(followed_id: user_id)
    end

    # フォローをはずす
    def unfollow(user_id)
        relationships.find_by(followed_id: user_id).destroy
    end

    # 退会後ログイン拒否
    def active_for_authentication?
        super && (self.is_deleted == false)
    end

    # おひとり暮らし歴
    def add_living_alone_month
        living_alone_month + 1
    end

end
