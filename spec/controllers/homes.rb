require 'rails_helper'

RSpec.describe "Homes", type: :request do
  describe 'トップページ' do
    context "トップページが正しく表示される" do
      before do
        get root_path
      end
      it 'リクエストは200 OKとなる' do
        expect(response.status).to eq 200
      end
    end
  end
  describe 'Aboutページ' do
    context "Aboutページが正しく表示される" do
      before do
        get about_path
      end
      it 'リクエストは200 OKとなる' do
        expect(response.status).to eq 200
      end
    end
  end
end