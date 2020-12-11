require 'rails_helper'

RSpec.describe User, type: :model do
  let!(:user) { create(:user) }

  describe '会員情報編集のバリデーションチェックテスト' do
    subject { user.valid? }
    
    context "自己紹介文以外全て入力されていれば保存される" do
      it { is_expected.to be_truthy }
    end
    context "ニックネームが空欄なので保存されない" do
      before { user.nickname = nil }

      it { is_expected.to be_falsey }
    end
    context "ニックネームが2文字以上なので保存される" do
      before { user.nickname = 'あ'*2 }

      it { is_expected.to be_truthy }
    end
    context "ニックネームが2の字未満なので保存されない" do
      before { user.nickname = 'あ' }

      it { is_expected.to be_falsey }
    end
    context "おひとり暮らし歴が空欄なので保存されない" do
      before { user.living_alone_month = nil }

      it { is_expected.to be_falsey }
    end
    context "おひとり暮らし歴がinteger型でないので保存されない" do
      before { user.living_alone_month = 'あ' }

      it { is_expected.to be_falsey }
    end
    context "自己紹介文が100文字以内なので保存される" do
      before { user.introduction = 'あ' * 100 }

      it { is_expected.to be_truthy }
    end
    context "自己紹介文が101文字以上なので保存されない" do
      before { user.introduction = 'あ' * 101 }

      it { is_expected.to be_falsey }
    end
  end
end