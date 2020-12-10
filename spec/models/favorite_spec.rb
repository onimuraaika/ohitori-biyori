require 'rails_helper'

RSpec.describe "Favorites", type: :system do
  let!(:user_1) { create(:user) }
  let!(:user_2) { create(:user) }

  let!(:genre) { create(:genre)  }
  let!(:article) { build(:article, user_id: user_1.id, genre_id: genre.id) }

  it do
    expect(article.valid?).to be_truthy
  end
end