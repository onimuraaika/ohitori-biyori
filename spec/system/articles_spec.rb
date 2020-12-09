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
    let!(:user) { create(:user) }
    let!(:genre) { create(:genre)  }
    let!(:article) { create(:article, user_id: user.id, genre_id: genre.id) }
    let(:title) { article.title }
    let(:body) { article.body }


    context '投稿詳細画面が表示される' do
      it do
        sign_in
        visit article_path(article)
        expect(current_path).to eq article_path(article)
      end
    end
  end

  describe '投稿機能のテスト' do
    context '投稿に成功すると投稿詳細画面に遷移する' do
      let!(:user) { create(:user) }
      let!(:genre) { create(:genre)  }
      let!(:article) { build(:article, id: 1, user_id: user.id, genre_id: genre.id) }

      before do
        sign_in
        visit new_article_path
        attach_file "article[image]", 'app/assets/images/test.png'
        fill_in 'article[title]', with: article.title
        select article.genre.name, from: 'article[genre_id]'
        fill_in 'article[body]', with: article.body
        find("input[value='投稿する']").click
      end

      it do
        expect(current_path).to eq article_path(id: article.id)
      end
    end
  end
end