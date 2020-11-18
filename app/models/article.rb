class Article < ApplicationRecord
  
    belongs_to :user
    belongs_to :genre
    has_many :favorites, dependent: :destroy
    has_many :article_comments, dependent: :destroy
    
end
