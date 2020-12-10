require 'rails_helper'

RSpec.describe "Favorites", type: :system do
  let!(:user_1) { create(:user) }
  let!(:user_2) { create(:user) }

  let!(:sign_in) do
    visit new_user_session_path
    fill_in 'user[nickname]', with: user_2.nickname
    fill_in 'user[password]', with: user_2.password
    click_button 'ログインする'
  end

  let!(:genre) { create(:genre)  }
  let!(:article) { create(:article, user_id: user_1.id, genre_id: genre.id) }

  xdescribe 'お気に入り登録機能のテスト' do
    before do
      visit article_path(article)
    end

    context 'お気に入り登録ボタンを押下' do
      it 'お気に入り登録する' do
        expect(page).to have_content 'お気に入り登録'
        click_button 'お気に入り登録'
        expect(page).to have_content 'お気に入り登録中'
      end
    end
  end
end