class ArticleComment < ApplicationRecord
  
    has_many   :notifications, dependent: :destroy
    belongs_to :user
    belongs_to :article
    
    validates :comment, presence: true, length: { maximum: 50 }
  
end
