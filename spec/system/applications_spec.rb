require 'rails_helper'

RSpec.describe "Applications", type: :request do
  
  describe '新規登録画面' do
    context "新規登録画面が正しく表示される" do
      before do
        get new_user_registration_path
      end
      it 'リクエストは200 OKとなる' do
        expect(response.status).to eq 200
      end
    end
  end
  
  describe 'ログイン画面' do
    context "ログイン画面が正しく表示される" do
      before do
        get new_user_session_path
      end
      it 'リクエストは200 OKとなる' do
        expect(response.status).to eq 200
      end
    end
  end
  
  describe 'パスワード変更画面' do
    let!(:user) { create(:user) }
    let!(:sign_in) do
      visit new_user_session_path
      fill_in 'user[nickname]', with: user.nickname
      fill_in 'user[password]', with: user.password
      click_button 'ログインする'
    end
    
    context "パスワード変更画面が正しく表示される" do
      before do
        get edit_user_registration_path(user)
      end
      it 'リクエストは200 OKとなる' do
        expect(response.status).to eq 200
      end
    end
  end
  
end