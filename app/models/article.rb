class Article < ApplicationRecord

    attachment :image

    belongs_to :user
    belongs_to :genre
    has_many :favorites, dependent: :destroy
    has_many :article_comments, dependent: :destroy

    validates :image, presence: true
    validates :title, presence: true, length: { minimum: 2, maximum: 20 }
    validates :genre_id, presence: true
    validates :body, presence: true, length: { minimum: 5, maximum: 200 }
    
    # user_idがFavoritesテーブル内に存在するか
    def favorited_by?(user)
	    favorites.where(user_id: user.id).exists?
	end

end
