require 'rails_helper'

RSpec.describe User, type: :model do

  describe '新規会員登録機能のバリデーションチェックテスト' do
    
    let!(:user) { build(:user) }

    subject { user.valid? }

    context '全て正しく入力されていれば保存される' do
      it { is_expected.to be_truthy }
    end
    context "ニックネームが空欄なので保存されない" do
      before { user.nickname = nil }

      it { is_expected.to be_falsey }
    end
    context "ニックネームが2文字以上なので保存される" do
      before { user.nickname = 'あ' * 2 }

      it { is_expected.to be_truthy }
    end
    context "ニックネームが2文字未満なので保存されない" do
      before { user.nickname = 'あ' }

      it { is_expected.to be_falsey }
    end
    context "メールアドレスが空欄なので保存されない" do
      before { user.email = nil }

      it { is_expected.to be_falsey }
    end
    context "メールアドレスが半角英数字でないので保存されない" do
      before { user.email = 'あ' }

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
    context "パスワードが空欄なので保存されない" do
      before { user.password = nil }

      it { is_expected.to be_falsey }
    end
    context "パスワード確認が空欄なので保存されない" do
      before { user.password_confirmation = '' }

      it { is_expected.to be_falsey }
    end
    context "パスワードが6文字未満なので保存されない" do
      before { user.password = 'p' }

      it { is_expected.to be_falsey }
    end
    context "パスワードとパスワード確認が一致しないので保存されない" do
      before do
        user.password = 'password'
        user.password_confirmation = 'passwords'
      end

      it { is_expected.to be_falsey }
    end
  end

  describe '会員情報編集機能のバリデーションチェックテスト' do
    let!(:user) { create(:user) }

    subject { user.valid? }

    context "自己紹介文以外が全て正しく入力されていれば保存される" do
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
    context "ニックネームが2文字未満なので保存されない" do
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
