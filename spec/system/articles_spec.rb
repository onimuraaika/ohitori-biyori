require 'rails_helper'

RSpec.describe "Articles", type: :system do
  let!(:user) { create(:user) }

  let(:sign_in) do
    visit new_user_session_path
    fill_in 'user[nickname]', with: user.nickname
    fill_in 'user[password]', with: user.password
    click_button 'ログインする'
  end

  it do
    sign_in
    visit new_article_path
    expect(current_path).to eq new_article_path
  end
end