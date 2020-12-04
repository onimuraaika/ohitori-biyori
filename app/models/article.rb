class Article < ApplicationRecord

    attachment :image

    acts_as_taggable_on :tags

    belongs_to :user
    belongs_to :genre
    has_many :favorites, dependent: :destroy
    has_many :article_comments, dependent: :destroy

    validates :image, presence: true
    validates :title, presence: true, length: { maximum: 20 }
    validates :body, presence: true

    # user_idがFavoritesテーブル内に存在するか
    def favorited_by?(user)
	    favorites.where(user_id: user.id).exists?
	end

end
