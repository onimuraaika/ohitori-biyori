require 'rails_helper'

RSpec.describe "Users", type: :system do

  describe '新規登録機能のテスト' do
    let!(:user) { create(:user) }

    before do
      visit new_user_registration_path
      fill_in 'user[nickname]', with: user.nickname
      fill_in 'user[email]', with: user.email
      fill_in 'user[living_alone_month]', with: user.living_alone_month
      fill_in 'user[password]', with: user.password
      fill_in 'user[password_confirmation]', with: user.password_confirmation
      click_button '新規会員登録する'
    end

    context '新規会員登録に成功する' do
      it '投稿一覧画面に遷移する' do
        expect(current_path).to eq articles_path
      end
    end
    context '新規会員登録に失敗する' do
      let(:nickname) { nil }

      it '遷移されないこと' do
        expect(current_path).to eq new_user_registration_path
      end
    end
  end

  describe 'ログイン機能のテスト' do
    let!(:user) { create(:user) }
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
      it '遷移されないこと' do
        expect(current_path).to eq new_user_session_path
      end
    end
  end

end