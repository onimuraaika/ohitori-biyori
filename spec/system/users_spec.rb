require 'rails_helper'

RSpec.describe "Users", type: :system do

  let!(:user) { create(:user) }

  describe 'ログイン機能の' do
    let(:nickname) { nil }
    let(:password) { nil }

    before do
      visit new_user_session_path
      fill_in 'user[nickname]', with: nickname
      fill_in 'user[password]', with: password
      click_button 'ログインする'
    end

    context 'ログインに成功する' do
      let(:nickname) { user.nickname }
      let(:password) { user.password }
      it '投稿一覧画面に遷移する' do
        expect(current_path).to eq articles_path
      end
    end
    context 'ログインに失敗する' do
      it '遷移されていないこと' do
        expect(current_path).to eq new_user_session_path
      end
    end
  end

end