require 'rails_helper'

RSpec.describe "Users", type: :system do
  let!(:user) { create(:user) }
  let!(:sign_in) do
    visit new_user_session_path
    fill_in 'user[nickname]', with: user.nickname
    fill_in 'user[password]', with: user.password
    click_button 'ログインする'
  end

  describe '/sign_in' do
    context 'ログインに成功' do

      it '投稿一覧画面に遷移する' do
        expect(current_path).to eq articles_path
      end
    end
    xcontext 'ログインに失敗' do
      it '遷移されていないこと' do
        expect(current_path).to eq new_user_session_path
      end
    end
  end

  describe 'ユーザー詳細(マイページ)画面' do
    context "ログイン済み" do
      it 'リクエストは200 OKとなる' do
        visit user_path(user)
        expect(current_path).to eq user_path(user)
      end
    end
  end
end