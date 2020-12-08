require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do
  include Devise::TestHelpers

  describe '新規投稿画面のテスト' do
    let!(:user) { create(:user) }
    let(:sign_in) do
      visit user_session_path
      fill_in 'user[nickname]', with: user.nickname
      fill_in 'user[password]', with: user.password
      click_button 'ログインする'
    end

    context "新規投稿画面が正しく表示される" do
      before do

      end
      it 'リクエストが200 OKとなる' do
        post user_session_path \
        "user[nickname]"    => user.nickname,
        "user[password]" => user.password

        get :index
        expect(response).to have_http_status 200
      end
    end
  end
end
