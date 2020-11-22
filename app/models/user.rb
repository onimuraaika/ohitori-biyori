class User < ApplicationRecord
    
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

    devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :validatable

    has_many :articles, dependent: :destroy
    has_many :favorites, dependent: :destroy
    has_many :article_comments, dependent: :destroy
    # 自分がフォローしてもらっている関係性
    has_many :passive_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
    # 自分をフォローしてくれている人
    has_many :followers, through: :passive_relationships, source: :following
    # 自分がフォローしている関係性
    has_many :relationships, class_name: "Relationship", foreign_key: "following_id", dependent: :destroy
    #自分がフォローしている人
    has_many :following, through: :relationships, source: :followed

    validates :nickname, presence: true, length: { minimum: 2, maximum: 20 }, uniqueness: true
    validates :living_alone_month, presence: true
    validates :email, presence: true
    validates :introduction, length: { maximum: 100 }

    attachment :profile_image

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

end
