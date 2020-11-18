class User < ApplicationRecord
  
    has_many :articles
    has_many :article_comments, dependent: :destroy
    has_many :favorites, dependent: :destroy
    #自分がフォローしてもらっている関係性
    has_many :passive_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
    # 自分をフォローしてくれている人
     has_many :followers, through: :passive_relationships, source: :following
    #自分がフォローしている関係性
    has_many :active_relationships, class_name: "Relationship", foreign_key: "following_id", dependent: :destroy
    #自分がフォローしている人
    has_many :followings, through: :active_relationships, source: :followers
    
  
end