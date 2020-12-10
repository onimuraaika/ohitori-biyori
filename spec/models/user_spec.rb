require 'rails_helper'

RSpec.describe User, type: :model do
  let!(:user) { create(:user) }

  subject { user.valid? }

  describe '会員情報編集のバリデーションチェックテスト' do
    context "自己紹介文以外全て入力されていれば保存される" do
      it { is_expected.to be_truthy }
    end
    context "自己紹介文以外に空欄があるので保存されない" do
      before { user.nickname = nil }

      it { is_expected.to be_falsey }
    end
    context "おひとり暮らし歴がintegerでないので保存されない" do
      before { user.living_alone_month = '1' }

      it { is_expected.to be_falsey }
    end
  end
end