class Genre < ApplicationRecord
  
    has_many :articles, dependent: :destroy
    
end
