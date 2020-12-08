require 'rails_helper'

RSpec.describe "Applications", type: :system do
  describe '新規登録画面' do
    context "新規登録画面が表示される" do
      it do
        visit new_user_registration_path
        expect(current_path).to eq new_user_registration_path
      end
    end
  end

  describe 'ログイン画面' do
    context "ログイン画面が正しく表示される" do
      it do
        visit new_user_session_path
        expect(current_path).to eq new_user_session_path
      end
    end
  end
end