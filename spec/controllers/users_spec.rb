require 'rails_helper'

RSpec.describe "Users", type: :request do
  let!(:user) { create(:user) }
  let(:sign_in) do
    visit new_user_session_path
    fill_in 'user[nickname]', with: user.nickname
    fill_in 'user[password]', with: user.password
    click_button 'ログインする'
  end

  describe '/sign_in' do
    context 'ログインに成功' do

      it '「successfully」という文言のメッセージが表示され' do
        sign_in
        expect(current_path).to eq articles_path
      end
    end
    xcontext 'ログインに失敗' do
      it '遷移されていないこと' do
        expect(current_path).to eq new_user_session_path
      end
    end
  end

  xdescribe 'ユーザー詳細(マイページ)画面' do
    context "ユーザー詳細(マイページ)画面が正しく表示される" do
      before do

      end
      it 'リクエストは200 OKとなる' do
        get root_path
        expect(response.status).to eq 200
      end
    end
  end
end