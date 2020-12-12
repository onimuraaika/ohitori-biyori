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
    let!(:genre)   { create(:genre)  }
    let!(:article) { create(:article, user_id: user.id, genre_id: genre.id) }
    let (:title)   { article.title }
    let (:body)    { article.body }

    context '投稿詳細画面が表示される' do
      it do
        sign_in
        visit article_path(article)
        expect(current_path).to eq article_path(article)
      end
    end
  end

  describe '投稿機能のテスト' do
    context '投稿に成功する' do
      let!(:genre)   { create(:genre)  }
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

      it '投稿詳細画面に遷移する' do
        expect(current_path).to eq article_path(id: article.id)
      end
    end

    context '投稿に失敗する' do
      let!(:genre)   { create(:genre)  }
      let!(:article) { build(:article, id: 1, user_id: user.id, genre_id: genre.id) }

      before do
        sign_in
        visit new_article_path
        attach_file "article[image]", nil
        fill_in 'article[title]', with: article.title
        select article.genre.name, from: 'article[genre_id]'
        fill_in 'article[body]', with: article.body
        find("input[value='投稿する']").click
      end

      it '投稿詳細画面に遷移しない' do
        expect(current_path).not_to eq article_path(id: article.id)
      end
    end
  end


  describe '投稿編集機能のテスト' do
    let!(:genre)   { create(:genre)  }
    let!(:article) { create(:article, id: 1, user_id: user.id, genre_id: genre.id) }

    context '更新が成功する' do
      before do
        sign_in
        visit edit_article_path(article)
        attach_file "article[image]", 'app/assets/images/test.png'
        fill_in 'article[title]', with: article.title
        select article.genre.name, from: 'article[genre_id]'
        fill_in 'article[body]', with: article.body
        click_button '更新する'
      end

      it '投稿詳細画面に遷移する' do
        expect(current_path).to eq article_path(article)
      end
    end
    context '更新が失敗する' do
      before do
        sign_in
        visit edit_article_path(article)
        fill_in 'article[title]', with: nil
        click_button '更新する'
      end

      it 'エラーメッセージ が表示される' do
        expect(page).to have_content 'タイトルを入力してください'
      end
    end
  end

end