require 'rails_helper'

RSpec.describe "Articles", type: :system do
  let!(:user) { create(:user) }

  let(:sign_in) do
    visit new_user_session_path
    fill_in 'user[nickname]', with: user.nickname
    fill_in 'user[password]', with: user.password
    click_button 'ログインする'
  end

  describe '新規投稿画面のテスト' do
    context '新規投稿画面が表示される' do
      it do
        sign_in
        visit new_article_path
        expect(current_path).to eq new_article_path
      end
    end
  end
  
  describe '投稿詳細画面のテスト' do
    let(:article) { build(:article) }
    let(:image) { article.image }
    let(:title) { article.title }
    let(:genre) { article.genre }
    let(:boby) { article.body }
    
    before do
      attach_file 'article[image]', with: image
      fill_in 'article[title]', with: title
      fill_in 'article[genre]', with: genre
      fill_in 'article[body]', with: body
      click_button '投稿する'
    end
    
    context '投稿詳細画面が表示される' do
      it do
        sign_in
        visit article_path(article)
        expect(current_path).to eq article_path
      end
    end
  end
end