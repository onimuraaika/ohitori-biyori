class Relationship < ApplicationRecord

    # フォローするfollowing、フォローされるfollowed
    belongs_to :following, class_name: "User"
    belongs_to :followed, class_name: "User"

    # 同じ関係は作らせない
    validates :following_id, uniqueness: {scope: :followed_id}

end
