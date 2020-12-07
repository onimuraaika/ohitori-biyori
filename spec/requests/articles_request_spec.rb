require 'rails_helper'

RSpec.describe "Articles", type: :request do
  
  
  describe '新規投稿画面のテスト' do
    let(:user) { create(:user) }
    let!(:sign_in) do
      visit new_user_session_path
      fill_in 'user[nickname]', with: user.nickname
      fill_in 'user[password]', with: user.password
      click_button 'ログインする'
    end
    
    context "新規投稿画面が正しく表示される" do
      before do
        get new_article_path
      end
      it 'リクエストが200 OKとなる' do
        expect(response.status).to eq 200
      end
    end
  end
  
end