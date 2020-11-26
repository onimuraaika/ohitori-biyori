class Favorite < ApplicationRecord

    belongs_to :user
    belongs_to :article

    # 同じ関係は作らせない
    validates :user_id, uniqueness: { scope: :article_id }

end
