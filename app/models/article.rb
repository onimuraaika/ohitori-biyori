class Article < ApplicationRecord

    belongs_to :user
    belongs_to :genre
    has_many :favorites, dependent: :destroy
    has_many :article_comments, dependent: :destroy

    validates :title, presence: true, length: { minimum: 5, maximum: 20 }
    validates :body, presence: true, length: { minimum: 10, maximum: 200 }

    attachment :image

end
