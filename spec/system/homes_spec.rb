require 'rails_helper'

RSpec.describe "Homes", type: :system do
  describe 'トップページのテスト' do
    context 'トップページが表示される' do
      it do
        visit root_path
        expect(current_path).to eq root_path
      end
    end
  end
  
  describe 'Aboutページのテスト' do
    context 'Aboutページが表示される' do
      it do
        visit about_path
        expect(current_path).to eq about_path
      end
    end
  end
end