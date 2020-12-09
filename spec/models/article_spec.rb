require 'rails_helper'

RSpec.describe Article, type: :model do
  describe '新規投稿のバリデーションチェックテスト' do
    context "全て入力してあるので保存される" do
      let!(:user) { create(:user) }
      let!(:article) { build(:article, user_id: user.id) }

      it { is_expected.to be_truthy }
    end
  end
end