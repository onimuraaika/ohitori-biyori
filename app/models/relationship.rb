class Relationship < ApplicationRecord
  
    #「belongs_to 変更したい親モデル名, class_name: "元々の親モデル名"」
    belongs_to :following, class_name: "User"
    belongs_to :followers, class_name: "User"
  
end
