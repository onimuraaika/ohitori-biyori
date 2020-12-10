require 'rails_helper'

RSpec.describe "Favorites", type: :system do
  let!(:user) { create(:user) }
  let!(:genre) { create(:genre)  }
  let!(:article) { created(:article, user_id: user.id, genre_id: genre.id) }
  let!(:favorite) { build(:favorite, user_id: user.id, article_id: article.id) }
  
  
end