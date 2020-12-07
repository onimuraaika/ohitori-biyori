require 'rails_helper'

RSpec.describe "Users", type: :request do
  let!(:user) { create(:user) }

  describe 'ユーザー詳細(マイページ)画面' do
    context "ユーザー詳細(マイページ)画面が正しく表示される" do
      before do
        get user_path(user)
      end
      it 'リクエストは200 OKとなる' do
        expect(response.status).to eq 200
      end
    end
  end
end